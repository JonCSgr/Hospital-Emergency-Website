<%-- 
    Document   : index
    Created on : Jan 3, 2021, 7:33:45 PM
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
    <h2>Log In Viagra Hospital</h2>

<form method="POST" action="controlPanel.jsp">
    
  <label for="username">username:</label><br>
  <input type="text" id="username" name="username" ><br>
  <label for="password">password:</label><br>
  <input type="password" id="password" name="password" <br><br>
  
  <select name="type" id="type">
  <option value="patient">patient</option>
  <option value="doctors">doctors</option>
  <option value="nurses">nurses</option>
  <option value="staff">staff</option>
</select>
  <input type="submit" value="Log In">
  
</form> 

    </center> 
        
        
        
        
        
        
        
        
        
        
        
    </body>
</html>
