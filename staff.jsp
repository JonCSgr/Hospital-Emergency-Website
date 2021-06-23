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
    <center><h1><u>Doctors</u></h1></center>
    <table>
        <tr>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Eidikotita</th>
        </tr>

        <tbody>
            <%
                if (session.getAttribute("type") != "Staff") {
                    String redirect = "invalidAccess.jsp";
                    response.sendRedirect(redirect);
                }
                Connection con;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

                st = con.prepareStatement("select * from doctors");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("firstname")%></td>
                <td><%=rs.getString("lastname")%></td>
                <td><%=rs.getString("speciality")%></td>
            </tr>

            <% }%>

        </tbody>
    </table>

    <br>

    <center><h1><u>Nurses</u></h1></center>
    <table>
        <tr>
            <th>FirstName</th>
            <th>LastName</th>      
        </tr>

        <tbody>
            <%
                PreparedStatement st1 = con.prepareStatement("select * from nurses");
                ResultSet rs1 = st1.executeQuery();
                while (rs1.next()) {
            %>
            <tr>
                <td><%=rs1.getString("firstname")%></td>
                <td><%=rs1.getString("lastname")%></td>
            </tr>

            <% }%>

        </tbody>
    </table>

    <br>

    <center><h1><u>Staff</u></h1></center>
    <table>
        <tr>
            <th>FirstName</th>
            <th>LastName</th>      
        </tr>

        <tbody>
            <%
                PreparedStatement st3 = con.prepareStatement("select * from staff");
                ResultSet rs3 = st3.executeQuery();
                while (rs3.next()) {
            %>
            <tr>
                <td><%=rs3.getString("firstname")%></td>
                <td><%=rs3.getString("lastname")%></td>
            </tr>

            <% }%>

        </tbody>
    </table>



</body>
</html>
