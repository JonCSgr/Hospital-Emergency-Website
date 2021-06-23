<%-- 
    Document   : examination
    Created on : Jan 8, 2021, 3:31:56 PM
    Author     : kp
--%>

<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <a href="mainpage.jsp" style="float: right;">Log Out</a> <br>
        <h1>wra gia e3etash</h1>

        <form method="POST" action="examcontrol.jsp">
            <p id="patient" name="patient" value="<%=request.getParameter("patient")%>" >Patient: <%=request.getParameter("patient")%></p>
            <br>

            <p>Diagnosis:</p>
            <textarea id="diagnose" name="diagnose" rows="4" cols="40" ></textarea>


            <p>Drug List:</p>
            <%
                Connection con;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");
                st = con.prepareStatement("select * from drugs");
                ResultSet rs = st.executeQuery();
                String amka = request.getParameter("patient");
                String[] parts = amka.split("`");
                String username = parts[0];
                String date = parts[1];
                session.setAttribute("username",username);
                session.setAttribute("date",date);
  
             
                while (rs.next()) {
                    String name = rs.getString("name");
                    String type = rs.getString("type");
                    int dosage = rs.getInt("dosage");
                    String usefor = rs.getString("usefor");
            %>
            <tr>
                <td><%=name%></td>
                <td><%=type%></td>
                <td><%=dosage%></td>
                <td><%=usefor%></td>
            <input type="radio" id="drug" name="drug" value=<%=rs.getString("name")%>>
            <br>
            </tr>
            <% }%>
<label>medical_exam</label>
            <select name="medical_exam" id="medical_exam">
                <option value="COVID-19_test">COVID-19 Test</option>
                <option value="kolonoskopisi">kolonoskopisi</option>
                <option value="aimatologikh">aimatologikh</option>
                <option value="genikes">genikes</option>
                <option value="Xray">Xray</option>
                <option value="no_exam">No exam</option>
            </select>
            <br>
            <label>epaexetasi/nosilia</label>
            <input type="checkbox" name="nosilia" value = "yes"> <br>
           
                <input type="submit">
                <br>
                </form>

                </body>
                </html>
