<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String date = request.getParameter("date");
    Connection con;
    PreparedStatement st;
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost/cs360", "root", "");

    st = con.prepareStatement("DELETE FROM `efimeries` WHERE username = ? && date = ?");
    st.setString(1, username);
    st.setString(2, date);
    st.executeUpdate();
    String redirect = "efimeries.jsp";
    response.sendRedirect(redirect);
%>