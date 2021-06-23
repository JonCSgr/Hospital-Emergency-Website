<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%
    String type = request.getParameter("type");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Connection con;
    PreparedStatement st;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");    
  con = DriverManager.getConnection("jdbc:mysql://localhost/cs370", "root", "");
    
    if (type.equals("patient")){
        //------------------>>>>   in patient amka acts as username   <<<--------------------- 
        st=con.prepareStatement("select amka from patient_data where amka = ?");
        st.setString(1,username);
        rs=st.executeQuery();
        if(rs.next()){
            String amkaDB = rs.getString("amka");
            st=con.prepareStatement("select password from patient_data where password = ?");
            st.setString(1,password);
            rs=st.executeQuery(); 
            if(rs.next()){
                String passwordDB = rs.getString("password");
                if(amkaDB.equals(username)){
                    if(passwordDB.equals(password)){
                       out.println("login!!"); 
                       session.setAttribute("username",username);
                        session.setAttribute("type","User");
                       String redirect = "user.jsp";
                       response.sendRedirect(redirect);
                    }
                }
            }else{
                out.println("false password"); 
            }
        }else{
            st = con.prepareStatement("insert into patient_data(amka,password) values(?,?)");
            st.setString(1,username);
            st.setString(2,password);
            //st.executeQuery();
            st.executeUpdate();
            session.setAttribute("username",username);
            session.setAttribute("type","User");
            String redirect = "user.jsp";
            response.sendRedirect(redirect);
        }     
         
    } else if (type.equals("doctors")){  
        
        st=con.prepareStatement("select username from doctors where username = ?");
        st.setString(1,username);
        rs=st.executeQuery();
        if(rs.next()){
            String name = rs.getString("username");
            st=con.prepareStatement("select password from doctors where password = ?");
            st.setString(1,password);
            rs=st.executeQuery(); 
            if(rs.next()){
                String passwordDB = rs.getString("password");
                if(name.equals(username)){
                    if(passwordDB.equals(password)){
                        session.setAttribute("username",username);
                       session.setAttribute("type","Doctor");
                        String redirect = "doctors.jsp";
                        response.sendRedirect(redirect);
                    }
                }
            }else{
                out.println("false password"); 
            }
        }else{
            out.println("invalid user");
        }
        
    } else if (type.equals("nurses")) {
        
        st=con.prepareStatement("select username from nurses where username = ?");
        st.setString(1,username);
        rs=st.executeQuery();
        if(rs.next()){
            String name = rs.getString("username");
            st=con.prepareStatement("select password from nurses where password = ?");
            st.setString(1,password);
            rs=st.executeQuery(); 
            if(rs.next()){
                String passwordDB = rs.getString("password");
                if(name.equals(username)){
                    if(passwordDB.equals(password)){
                         session.setAttribute("type","Nurses");
                        session.setAttribute("username",username);
                        String redirect = "nurses.jsp";
                        response.sendRedirect(redirect);
                    }
                }
            }else{
                out.println("false password"); 
            }
        }else{
            out.println("invalid user");
        }
        
    } else if (type.equals("staff")) {
        
        st=con.prepareStatement("select username from staff where username = ?");
        st.setString(1,username);
        rs=st.executeQuery();
        if(rs.next()){
            String name = rs.getString("username");
            st=con.prepareStatement("select password from staff where password = ?");
            st.setString(1,password);
            rs=st.executeQuery(); 
            if(rs.next()){
                String passwordDB = rs.getString("password");
                if(name.equals(username)){
                    if(passwordDB.equals(password)){
                        session.setAttribute("username",username);
                        session.setAttribute("type","Staff");
                        String redirect = "staff.jsp";
                        response.sendRedirect(redirect);
                    }
                }
            }else{
                out.println("false password"); 
            }
        }else{
            out.println("invalid user");
        }
        
    } else {
        out.println("TON MPOULO");
    }


%>