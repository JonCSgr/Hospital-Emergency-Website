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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center><h1><u>TMHMA EPIGONTON PERISTATIKON CONTROL PANEL</u></h1>
             <form method="POST" action="visitsCheck.jsp">

                    <label for="amka:">amka:</label>
                    <input type="amka" id="amka" name="amka" >
                    <input type="submit" name="check" value="check">   

                </form>          
                
                  
                    <form method="POST" action="AddSymptom.jsp">

                    <label for="symptom">Asthenia:</label>
                    <input type="symptom" id="symptom" name="symptom" >
                    <input type="submit" name="symptom" value="Insert">   

                </form>
                <h2>Kartela Astheni</h2>

                <table style="width:100%">
                    <tr>

                        <th>amka</th>
                        <th>firstName</th>
                        <th>lastName</th>
                        <th>address</th>
                        <th>insurance</th>
                        <th>chronic_conditions</th>
                    </tr>


                    <tbody>
                        <%

                            Connection con;

                            Class.forName("com.mysql.jdbc.Driver");

                            con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");
                            String amka = request.getParameter("amka");
                            PreparedStatement st3 = con.prepareStatement("SELECT * FROM patient_data where amka = ?");
                            st3.setString(1, amka);

                            ResultSet rs3 = st3.executeQuery();

                            while (rs3.next()) {


                        %>

                        <tr>

                            <td><%=rs3.getString("amka")%></td>
                            <td><%=rs3.getString("firstName")%></td>
                            <td><%=rs3.getString("lastName")%></td>
                            <td><%=rs3.getString("address")%></td>
                            <td><%=rs3.getString("insurance")%></td>
                            <td><%=rs3.getString("chronic_conditions")%></td>  


                        </tr>

                        <% }%>         
                    </tbody>


                </table>


                <h2>EPISKEPSEIS</h2>

                <table style="width:100%">
                    <tr>

                        <th>date</th>
                        <th>diagnose</th>
                        <th>medical_exam</th>
                        <th>therapy</th>
                        <th>symptoms</th>         
                    </tr>


                    <tbody>
                        <%

                            String amka1 = request.getParameter("amka");
                            PreparedStatement st = con.prepareStatement("SELECT * FROM visits where username = ? ORDER BY YEAR(Date) DESC, MONTH(Date) DESC, DAY(DATE) DESC");
                            st.setString(1, amka);

                            ResultSet rs = st.executeQuery();

                            while (rs.next()) {


                        %>

                        <tr>
                            <td><%=rs.getString("date")%></td>
                            <td><%=rs.getString("diagnose")%></td>
                            <td><%=rs.getString("medical_exam")%></td>
                            <td><%=rs.getString("therapy")%></td>
                            <td><%=rs.getString("symptoms")%></td>               
                        </tr>

                        <% }%>         
                    </tbody>


                </table>















                </center>
                </body>
                </html>
