<%-- 
    Document   : cadastraUsuarios
    Created on : 26 de nov. de 2022, 18:06:19
    Author     : vanes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<% 
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");
    String senha = request.getParameter("senha");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/WebPage";
    String usuario = "postgres";
    String senhaBD = "123";
    
    try{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url,usuario,senhaBD);
        st = con.createStatement();
        st.execute("INSERT INTO usuarios(nome,email,telefone,senha) VALUES('"+nome+"','"+email+"','"+telefone+"','"+senha+"') ");
        response.sendRedirect("../usuarios.jsp?erro=6");
    }catch(Exception e){
    out.println(e);
    }
%>
