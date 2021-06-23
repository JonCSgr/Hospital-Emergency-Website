<%@page import="java.sql.*" %> 
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
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
<center> <h1>Efimeria:</h1>

    <form method="POST" action="createEfimeries.jsp">

        <label for="username">username</label><br>
        <input type="text" id="username" name="username" <br><br> 

        <label for="id">date</label><br>
        <input type="date" id="id" name="date" <br><br>

        <button type="submit" name="submit" value="submit">Insert</button>
        <button type="submit" formaction="deleteEfimeria.jsp">delete</button>

    </form>
    <br><br>


    <table style="width:100%">
        <tr>

            <th>date</th>
            <th>user</th>
            <th>FirstName</th>
            <th>LastName</th>
            <th>speciality</th>
            <th>type</th>
        </tr>


        <tbody>
            <%
                Connection con;

                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");
                PreparedStatement st3 = con.prepareStatement("SELECT * FROM efimeries WHERE date >= CURDATE()order by date ASC");

                PreparedStatement data = con.prepareStatement("select * from efimeries ");
                ResultSet rs3 = st3.executeQuery();
                ResultSet currentData = data.executeQuery();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String formatted = df.format(new Date());

                Calendar c = Calendar.getInstance();
                c.setTime(df.parse(formatted));
                c.add(Calendar.DATE, 1);  // number of days to add
                formatted = df.format(c.getTime());

                PreparedStatement countDiffDr = con.prepareStatement("select count(distinct (speciality)) as num from efimeries where date = ? && type='Doctor' ");
                countDiffDr.setString(1, formatted);
                ResultSet o = countDiffDr.executeQuery();

                PreparedStatement countStaff = con.prepareStatement("select count(distinct (username)) as num1 from efimeries where date = ? && type='staff' ");
                countStaff.setString(1, formatted);
                ResultSet o1 = countStaff.executeQuery();

                PreparedStatement countNurse = con.prepareStatement("select count(distinct (username)) as num2 from efimeries where date = ? && type='Nurse' ");
                countNurse.setString(1, formatted);
                ResultSet o2 = countNurse.executeQuery();
                if (o.next())

                    if (o1.next())

                        if (o2.next())

                   
                            while (rs3.next()) {


            %>

            <tr>

                <td><%=rs3.getString("date")%></td>
                <td><%=rs3.getString("username")%></td>
                <td><%=rs3.getString("firstname")%></td>
                <td><%=rs3.getString("lastname")%></td>
                <td><%=rs3.getString("speciality")%></td>
                <td><%=rs3.getString("type")%></td>  


            </tr>

            <% }  %>
            Required to run TEP 5 each Doctors,Nurses,Staff.<br>
            <% if (o.getInt("num") - 5 >= 0 && o1.getInt("num1") - 5 >= 0 && o2.getInt("num2") - 5 >= 0) {
            %><h1 style="background-color:greenyellow;">STATUS: Enough to Run TEP</h1><%
            } else {%>
        <h1 style="background-color:tomato;">STATUS: Not Enough to Run TEP</h1>
        <%   }%>

        Different Doctors avaliable  <%out.print(o.getInt("num"));%> <br>
        Nurses avaliable<%out.print(o2.getInt("num2"));%> <br>
        Staff avaliable <%out.print(o1.getInt("num1"));%>  <br>

        </tbody>


    </table>
</center>
</body>
</html>
