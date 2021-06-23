<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String address = request.getParameter("address");
    String insurance = request.getParameter("insurance");
    String chronic = request.getParameter("chronic");

    Connection con;
    PreparedStatement st;
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

    if (!firstname.isEmpty()) {
        st = con.prepareStatement("update patient_data set firstName=? where amka =?");
        st.setString(1, firstname);
        st.setString(2, session.getAttribute("username").toString());
        st.executeUpdate();
    }
    if (!lastname.isEmpty()) {
        st = con.prepareStatement("update patient_data set lastName=? where amka =?");
        st.setString(1, lastname);
        st.setString(2, session.getAttribute("username").toString());
        st.executeUpdate();
    }
    if (!address.isEmpty()) {
        st = con.prepareStatement("update patient_data set address=? where amka =?");
        st.setString(1, address);
        st.setString(2, session.getAttribute("username").toString());
        st.executeUpdate();
    }
    if (!insurance.isEmpty()) {
        st = con.prepareStatement("update patient_data set insurance=? where amka =?");
        st.setString(1, insurance);
        st.setString(2, session.getAttribute("username").toString());
        st.executeUpdate();
    }
    if (!chronic.isEmpty()) {
        st = con.prepareStatement("update patient_data set chronic_conditions=? where amka =?");
        st.setString(1, chronic);
        st.setString(2, session.getAttribute("username").toString());
        st.executeUpdate();
    }

    String redirect = "user.jsp";
    response.sendRedirect(redirect);
%>