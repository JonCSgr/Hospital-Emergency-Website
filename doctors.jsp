<%-- 
    Document   : doctors
    Created on : Jan 3, 2021, 10:11:43 PM
    Author     : Me
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <center><u><h1>ELA NA PAI3OUME TON GIATRO</h1></u></center>
        <form method="POST" action="examination.jsp">
            <table style="width:100%">
                <tr>

                    <th>username</th>
                    <th>date</th>
                    <th>diagnose</th>
                    <th>medical_exam</th>
                    <th>anafora</th>
                    <th>therapy</th>
                    <th>nosilia</th>

                </tr>

                <tbody>
                    <%
                        if(session.getAttribute("type")!="Doctor"){
                            String redirect = "invalidAccess.jsp";
                        response.sendRedirect(redirect);
                        }
                        Connection con;
                        PreparedStatement st;
                        Class.forName("com.mysql.jdbc.Driver");

                        con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");
                        st = con.prepareStatement("select * from visits");
                      
                        //st.setString(1, session.getAttribute("username").toString());
                        ResultSet rs = st.executeQuery();

                        while (rs.next()) {
                            String username = rs.getString("username");
                            String date = rs.getString("date");
                            String diagnose = rs.getString("diagnose");
                            String medical_exam = rs.getString("medical_exam");
                            String anafora = rs.getString("anafora");
                            String drug = rs.getString("therapy");
                            String nosilia = rs.getString("nosilia");
                            if (medical_exam == null || medical_exam.isEmpty() || !medical_exam.equals("no_exam")) {

                               // if (nosilia == null || nosilia.isEmpty()) {

                    %>
                    <tr>

                        <td><%=username%></td>
                        <td><%=date%></td>
                        <td><%=diagnose%></td>
                        <td><%=medical_exam%></td>
                        <td><%=anafora%></td>
                        <td><%=drug%></td>
                        <td><%=nosilia%></td>
                        <td><input type="radio" id="patient" name="patient" value="<%=username+"`"+date%>"</td>
                <br>



                </tr>

                <% }
                        
                    }%>

                </tbody>
            </table>
            <input type="submit" id="Examine" name="Examine" value="Examine">
        </form>
    </body>
</html>
