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
    </head>
    <body><center>
        <b><u><h1>Edw einai oloi oi astheneis me covid </h1></b></u> <br><br>
    <table style="width:100%">
        <tr>
            <th>date</th>
            <th>amka</th>
            <th>FirstName</th>
            <th>LastName</th>
            <th>address</th>
            <th>insurance</th>
            <th>address</th>
            <th>chronic</th>
        </tr>

        <tbody>
            <%
                Connection con;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

                st = con.prepareStatement("select date,amka,firstName,lastName,address,insurance,chronic_conditions,diagnose from visits inner join patient_data on visits.username = patient_data.amka where medical_exam = 'COVID-19_test' ; ");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {


            %>
            <tr>
                 <td><%=rs.getString("date")%></td>
                <td><%=rs.getString("amka")%></td>
                <td><%=rs.getString("firstName")%></td>
                <td><%=rs.getString("lastName")%></td>
                <td><%=rs.getString("address")%></td>
                <td><%=rs.getString("insurance")%></td>
                    <td><%=rs.getString("address")%></td>
                <td><%=rs.getString("chronic_conditions")%></td>



            </tr>

            <% }%>

        </tbody>
    </table>
</center>

</body>
</html>
