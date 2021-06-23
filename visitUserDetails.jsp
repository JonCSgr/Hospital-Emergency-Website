<%-- 
    Document   : visitUserDetails
    Created on : Jan 9, 2021, 2:27:54 PM
    Author     : Me
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h2>O xristis <% out.println(request.getParameter("amka"));%>Den iparxei , dimiourgia </h2>
        <form method="POST" action="createVisitNotExist.jsp" >

             <label for="amka">amka</label><br>
            <input type="text" id="amka" name="amka" <br><br>
            
            <label for="password">password</label><br>
            <input type="text" id="password" name="password" <br><br>

            <label for="firstname">firstname</label><br>
            <input type="text" id="firstname" name="firstname" <br><br>

            <label for="lastname">lastname</label><br>
            <input type="text" id="lastname" name="lastname" ><br>

            <label for="address">address</label><br>
            <input type="text" id="address" name="address" <br><br>

            <label for="insurance">insurance</label><br>
            <input type="text" id="insurance" name="insurance" ><br>

            <label for="chronic">chronic</label><br>
            <input type="text" id="chronic" name="chronic" <br><br>

             <label for="symptom">symptom</label><br>
            <input type="text" id="symptom" name="symptom" <br><br>
            
            <input type="submit" name="submit" value="submit">

        </form>
    </body>
</html>
