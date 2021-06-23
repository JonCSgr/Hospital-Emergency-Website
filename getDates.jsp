<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String startDate = request.getParameter("startdate");
    String endDate = request.getParameter("enddate");

    session.setAttribute("start", startDate);
    session.setAttribute("end", endDate);
    
    String redirect = "staff_statistics.jsp?startDate=" + startDate;
    response.sendRedirect(redirect);

%>