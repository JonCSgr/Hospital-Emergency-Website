<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String username = session.getAttribute("username").toString();
    String date = session.getAttribute("date").toString();
    String diagnose = request.getParameter("diagnose");
    String medicalexam = request.getParameter("medical_exam");
    String drug = request.getParameter("drug");
   String nosilia = request.getParameter("nosilia");
    Connection con;
    PreparedStatement st;
    Class.forName("com.mysql.jdbc.Driver");

         con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");
    st = con.prepareStatement("update visits set diagnose= ?, medical_exam= ?, therapy=?,nosilia=? where username=? AND date =?");
    
    st.setString(1, diagnose);
    st.setString(2, medicalexam);
    st.setString(3, drug);
       st.setString(4,nosilia);
    st.setString(5, username);
    st.setString(6, date);
 
     st.executeUpdate();
    String redirect = "doctors.jsp";
    response.sendRedirect(redirect);
    
%>