<%@page import="java.sql.*" %> 
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
<body>
<center>
    <b><u><h1>KATASTASH EPISKEPSEON GIA TIN SIMERINI IMEROMINIA</h1></b></u> <br><br>
<table style="width:100%">
    <tr>
        <th>date</th>
        <th>username</th>
        <th>anafora</th>
        <th>diagnose</th>
        <th>medical_exam</th>
        <th>nosilia</th>
        <th>symptoms</th>
        <th>therapy</th>
    </tr>

    <tbody>
        <%
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formatted = df.format(new Date());
        %><h1>Todays Date: <% out.println(formatted); %> </h3 <%
                Connection con;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

                st = con.prepareStatement("select * from visits where date = ? ");
                st.setString(1, formatted);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {


        %>
        <tr>
            <td><%=rs.getString("date")%></td>
            <td><%=rs.getString("username")%></td>
            <td><%=rs.getString("anafora")%></td>
            <td><%=rs.getString("diagnose")%></td>
            <td><%=rs.getString("medical_exam")%></td>
            <td><%=rs.getString("nosilia")%></td>
            <td><%=rs.getString("symptoms")%></td>
            <td><%=rs.getString("therapy")%></td>



        </tr>

        <% }%>

        </tbody>
</table>
</center>

</body>
</html>
