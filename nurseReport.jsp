<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String report = request.getParameter("report");
    String id = request.getParameter("id");

    Connection con;
    PreparedStatement st;
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

    st = con.prepareStatement("update visits set anafora=?  where id =?");
    st.setString(1, report);
    st.setString(2,id);
    st.executeUpdate();
    
    String redirect = "nurses.jsp";
    response.sendRedirect(redirect);
%>