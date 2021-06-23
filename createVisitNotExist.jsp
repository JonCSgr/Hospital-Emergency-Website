<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String amka1 = request.getParameter("amka");
    String password = request.getParameter("password");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String address = request.getParameter("address");
    String insurance = request.getParameter("insurance");
    String chronic = request.getParameter("chronic");
    String symptom = request.getParameter("symptom");

    Connection con;
    PreparedStatement st;
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

    st = con.prepareStatement("insert into patient_data set amka = ? ,password = ?, firstName=? ,lastName =? , address =? , insurance = ? , chronic_conditions = ?");
    st.setString(1, firstname);
    st.setString(2, lastname);
    st.setString(3, address);
    st.setString(4, insurance);
    st.setString(5, chronic);
    st.setString(6, amka1);
    st.setString(7, password);
    st.executeUpdate();

    st = con.prepareStatement("insert into visits(username,symptoms,date) values(?,?,?)");
    st.setString(1, amka1);
    st.setString(2, symptom);
    st.setTimestamp(3,new java.sql.Timestamp(new java.util.Date().getTime()));
    st.executeUpdate();

    String redirect = "episkepseis.jsp?amka=" + amka1;
    response.sendRedirect(redirect);
%>