<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String amka = request.getParameter("amka");

    Connection con;
    PreparedStatement st;
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

    st = con.prepareStatement("select * from patient_data where amka = ?");
    st.setString(1, amka);
    session.setAttribute("amka", amka);
    ResultSet rs = st.executeQuery();

    if (rs.next()) {
        String redirect = "episkepseis.jsp?amka=" + amka;
        response.sendRedirect(redirect);
    } else {
        String redirect = "visitUserDetails.jsp?amka=" + amka;
        response.sendRedirect(redirect);
    }


%>



