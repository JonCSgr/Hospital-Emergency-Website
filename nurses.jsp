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
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <div style="float:right">
<form align="right" name="form1" method="post" action="endSession.jsp">
  <label class="logoutLblPos">
  <input name="submit2" type="submit" id="submit2" value="log out">
  </label>
</form>
</div>
    <center> <b> <u> <h1>NOSOKOMA CONTROL PANEL!</h1></b></u>
    <form method="POST" action="nurseReport.jsp">

        <label for="report">id</label>
        <input type="id" id="id" name="id" >

        <br>
        <label for="report">anafora_exetasis</label>
        <input type="report" id="report" name="report" ><br>
        <input type="submit" name="check" value="check">   

    </form>          


    <center><h1><u>Exetaseis asthenon , simplirose tin anafora :</u></h1></center>
    <table style="width:100%">
        <tr>

            <th>date</th>
            <th>id</th>
            <th>amka</th>
            <th>diagnose</th>
            <th>medical_exam</th>
            <th>therapy</th>
            <th>symptoms</th>     
            <th>Anafora_Nosileytrias</th>
        </tr>


        <tbody>
            <%
                if (session.getAttribute("type") != "Nurses") {
                    String redirect = "invalidAccess.jsp";
                    response.sendRedirect(redirect);
                }
                Connection con;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

                st = con.prepareStatement("select * from visits where medical_exam IS NOT NULL");
                ResultSet rs = st.executeQuery();

                while (rs.next()) {


            %>

            <tr>
                <td><%=rs.getString("date")%></td>
                <td><%=rs.getString("id")%></td>
                <td><%=rs.getString("username")%></td>
                <td><%=rs.getString("diagnose")%></td>
                <td><%=rs.getString("medical_exam")%></td>
                <td><%=rs.getString("therapy")%></td>
                <td><%=rs.getString("symptoms")%></td>  
                <td><%=rs.getString("anafora")%></td>    
            </tr>

            <% }%>         
        </tbody>
    </table>


</center>
</body>
</html>
