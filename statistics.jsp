<%-- 
    Document   : statistics
    Created on : Jan 9, 2021, 11:42:59 PM
    Author     : kp
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            .topnav {
                overflow: hidden;
                background-color: #333;
            }

            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>
    <body>
         <div style="float:right">
<form align="right" name="form1" method="post" action="endSession.jsp">
  <label class="logoutLblPos">
  <input name="submit2" type="submit" id="submit2" value="log out">
  </label>
</form>
</div>
        <div class="topnav">
        <a class="active" href="http://localhost:9999/project360/staff.jsp">Home</a>
            <a href="http://localhost:9999/project360/efimeries.jsp">Efimeries</a>
            <a href="http://localhost:9999/project360/episkepseis.jsp">Episkepseis</a>   
            <a href="http://localhost:9999/project360/visits_status.jsp">katastasi_episkepseon</a>  
 
            <a href="http://localhost:9999/project360/covid.jsp">Covid19-report</a>  
            <a href="http://localhost:9999/project360/staff_statistics.jsp">efimeries_prosopikoy</a> 
            <a href="http://localhost:9999/project360/statistics.jsp">statistics(day,month)</a> 
            <a href="http://localhost:9999/project360/freeText.jsp">free_text</a>

        </div>
        <form form method="POST" action="statistics.jsp">
            <h1>Statistics, Bitch!!</h1>
            <label for="id">date</label><br>
            
            <input type="date" id="date" name="date" <br>
            <td>Day<input type="radio" id="log" name="log" value="logD"</td> 
            <td>Month<input type="radio" id="log" name="log" value="logM"</td>
            
            <input type="submit" name="show" value="Show Logs">
            <br>
            <table>
                <tr>
                    <th>amka</th>
                    <th>date</th>
                    <th>diagnose</th>
                    <th>medical_exam</th>
                    <th>therapy</th>
                </tr>

            <tbody>
            <%
                    Connection con;
                    PreparedStatement st,st1,st2;
                    ResultSet rs,rs1,rs2;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                 con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");
                    
                    st = con.prepareStatement("select * from visits where date=?"); 
                    st.setString(1, request.getParameter("date")); 
                    rs = st.executeQuery();
                    String log= request.getParameter("log");
                    
                    if(log!=null){
                        //out.println(log);
                        if(request.getParameter("log").equals("logM")){
                            st = con.prepareStatement("select * from visits where MONTH(date)=MONTH(?)");
                            st.setString(1, request.getParameter("date"));
                            rs = st.executeQuery();
                            st1 = con.prepareStatement("select count(distinct medical_exam) as num from visits where MONTH(date)=MONTH(?) AND  medical_exam!='no_exam'"); 
                            st1.setString(1, request.getParameter("date"));
                            rs1 = st1.executeQuery();
                            if(rs1.next()){
                                out.println("exams conducted: "+rs1.getInt("num"));
                            }
                            st2 = con.prepareStatement("select count(distinct therapy) as num from visits where MONTH(date)=MONTH(?)"); 
                            st2.setString(1, request.getParameter("date"));                            
                            rs2 = st2.executeQuery();
                            if(rs2.next()){
                                out.println("drugs given: "+rs2.getInt("num"));                            
                            }
                        }else if(request.getParameter("log").equals("logD")){
                            st = con.prepareStatement("select * from visits where date=?"); 
                            st.setString(1, request.getParameter("date")); 
                            rs = st.executeQuery();
                            st1 = con.prepareStatement("select count(distinct medical_exam) as num from visits where date=? AND medical_exam!='no_exam'"); 
                            st1.setString(1, request.getParameter("date"));
                            rs1 = st1.executeQuery();
                            if(rs1.next()){
                                out.println("exams conducted: "+rs1.getInt("num"));
                            }
                            st2 = con.prepareStatement("select count(distinct therapy) as num from visits where date=?"); 
                            st2.setString(1, request.getParameter("date"));                            
                            rs2 = st2.executeQuery();
                            if(rs2.next()){
                                out.println("drugs given: "+rs2.getInt("num"));                            
                            }
                        }
                    }else{
                        st = con.prepareStatement("select * from visits where date=?"); 
                        st.setString(1, "0000-00-00"); 
                        rs = st.executeQuery();
                        out.println("choose log!");
                    }
                    
                    while (rs.next()) {
                        String amka = rs.getString("username");
                        String date = rs.getString("date");
                        String diagnose = rs.getString("diagnose");
                        String medicalexam = rs.getString("medical_exam");
                        String report = rs.getString("anafora");
                        String drug = rs.getString("therapy");
            %>
                        <tr>
                            <td><%=amka%></td>
                            <td><%=date%></td>
                            <td><%=diagnose%></td>
                            <td><%=medicalexam%></td>
                            <td><%=report%></td>
                            <td><%=drug%></td>
                        </tr>

            <% } %>

                </tbody>
            </table>
        </form>
    </body>
</html>
