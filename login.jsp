<%@ page language="java" contentType="text/html" %>
<%@ page import=" java.io.* ,java.util.*,java.sql.*" %>

<% 
    try{
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internal","root","");
        Statement st = con.createStatement();
        String query = "select * from users where email='"+email+"' and password='"+password+"'  ";
        ResultSet rs= st.executeQuery(query);
        if(! rs.next()) {
%>      
            <jsp:forward page="restaurants_data.html"/>
<%
        }
        else{
%>
        <jsp:forward page="restaurants_data.html"/>
<%
        }
    }
    catch(Exception e){
        out.print(e.getMessage());
    }
%>