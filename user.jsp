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
               </div><br>
    <center>

        <form method="POST" action="add.jsp" >



            <label for="firstname">firstname</label><br>
            <input type="text" id="firstname" name="firstname" <br><br>

            <label for="lastname">lastname</label><br>
            <input type="text" id="lastname" name="lastname" ><br>

            <label for="address">address</label><br>
            <input type="text" id="address" name="address" <br><br>

            <label for="insurance">insurance</label><br>
            <input type="text" id="insurance" name="insurance" ><br>

            <label for="chronic">chronic</label><br>
            <input type="text" id="chronic" name="chronic" <br><br>

            <input type="submit" name="submit" value="submit">

        </form>
        <br><br>
        <table style="width:100%">
            <tr>
                <th>amka</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>address</th>
                <th>insurance</th>       
                <th>chronic</th>
            </tr>

            <tbody>
                <%
                    if (session.getAttribute("type") != "User") {
                        String redirect = "invalidAccess.jsp";
                        response.sendRedirect(redirect);
                    }
                    Connection con;
                    PreparedStatement st;
                    Class.forName("com.mysql.jdbc.Driver");

                    con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

                    st = con.prepareStatement("select * from patient_data where amka=?");
                    st.setString(1, session.getAttribute("username").toString());
                    ResultSet rs = st.executeQuery();
                    while (rs.next()) {


                %>
                <tr>
                    <td><%=rs.getString("amka")%></td>
                    <td><%=rs.getString("firstName")%></td>
                    <td><%=rs.getString("lastName")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("insurance")%></td>
                    <td><%=rs.getString("chronic_conditions")%></td>



                </tr>

                <% }%>

            </tbody>
        </table>

        <br><br><br><br><br><br><br>
        <table style="width:100%">
            <tr>
                <th>date</th>
                <th>Diagnose</th>
                <th>symptoms</th>
                <th>nosilia</th>
                <th>iatriki_exetasi</th>
                <th>therapeia</th>        
            </tr>


            <tbody>
                <%
                    Connection conn;
                    PreparedStatement stt;
                    Class.forName("com.mysql.jdbc.Driver");

                    conn = DriverManager.getConnection("jdbc:mysql://localhost/cs360", "root", "");
                    stt = conn.prepareStatement("select * from visits where username = ?");
                    stt.setString(1, session.getAttribute("username").toString());
                    ResultSet rs1 = stt.executeQuery();
                    while (rs1.next()) {


                %>
                <tr>
                    <td><%=rs1.getString("date")%></td>
                    <td><%=rs1.getString("diagnose")%></td>
                    <td><%=rs1.getString("symptoms")%></td>
                    <td><%=rs1.getString("nosilia")%></td>
                    <td><%=rs1.getString("medical_exam")%></td>
                    <td><%=rs1.getString("therapy")%></td>
                </tr>

                <% }%>

            </tbody>
        </table>

    </center>      
</body>
</html>
