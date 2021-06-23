<%-- 
    Document   : endSession
    Created on : Jan 13, 2021, 10:22:02 PM
    Author     : Me
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% session.setAttribute("type", "invalid");

String redirect = "mainpage.jsp";
response.sendRedirect(redirect);


%>