<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String date = request.getParameter("date");

    Connection con;
    PreparedStatement st;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");
    st = con.prepareStatement("SELECT * FROM (SELECT username,firstname,lastname,speciality,type FROM doctors UNION  SELECT username,firstname,lastname,null,type FROM nurses UNION select username,firstname,lastname,null,type from staff)t WHERE username = ?");
    st.setString(1, username);
    ResultSet rs;
    rs = st.executeQuery();
    String firstname = null, lastname = null, speciality = null, type = null;
    while (rs.next()) {

        firstname = rs.getString("firstname");
        lastname = rs.getString("lastname");
        speciality = rs.getString("speciality");
        type = rs.getString("type");
        if (speciality == null) {
            speciality = "No Speciality";
        }
    }
    st = con.prepareStatement("insert into efimeries values(?,?,?,?,?,?)");
    st.setString(1, username);
    st.setString(2, date);
    st.setString(3, firstname);
    st.setString(4, lastname);
    st.setString(5, speciality);
    st.setString(6, type);

    st.executeUpdate();

    String redirect = "efimeries.jsp";
    response.sendRedirect(redirect);

   
%>


