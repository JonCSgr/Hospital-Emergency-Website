<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String symtpoma = request.getParameter("symptom");
    String username = session.getAttribute("amka").toString();
   

    Connection con;
    PreparedStatement st;
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");

    st = con.prepareStatement("insert into visits set  username = ? , symptoms = ? ,date = ? ");

    st.setString(1, username);
    st.setString(2, symtpoma);
    st.setTimestamp(3,new java.sql.Timestamp(new java.util.Date().getTime()));

    st.executeUpdate();
     String redirect = "episkepseis.jsp?amka="+username;
    response.sendRedirect(redirect);


%>