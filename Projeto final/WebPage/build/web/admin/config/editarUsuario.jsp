<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>


<%
    String id = request.getParameter("id");
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
        st.executeUpdate("UPDATE usuarios SET nome='"+nome+"', email='"+email+"', telefone='"+telefone+"', senha='"+senha+"' WHERE id='"+id+"' ");
        response.sendRedirect("../usuarios.jsp?erro=7");
    }catch(Exception e){
    out.println(e);
    }
%>
