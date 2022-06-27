<%@ page language="java" contentType="text/html" %>
<%@ page import=" java.io.* ,java.util.*,java.sql.*" %>

<% 
    try{
        String first = request.getParameter("first");
        String last = request.getParameter("last");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internal","root","");
        Statement st = con.createStatement();
        String query = "insert into users values('"+first+"','"+last+"','"+email+"','"+password+"')";
        int rs= st.executeUpdate(query);
%>
        <jsp:forward page="login.html"/>
<%
    }
    catch(Exception e){
%>
    <jsp:forward page="registration.html"/>
<%
    }
%>