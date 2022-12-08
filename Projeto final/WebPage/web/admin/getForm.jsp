<%-- 
    Document   : getForm.jsp
    Created on : 26 de nov. de 2022, 17:55:15
    Author     : vanes
--%>

<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@page import="util.Upload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    Upload up = new Upload();
    up.setFolderUpload("arquivos");
    if (up.formProcess(getServletContext(), request)) {
        //Arquivos
        String imagem = up.getFiles().get(0);
        String nome = up.getForm().get("nome").toString();
        String desc = up.getForm().get("desc").toString();
        Float valor = Float.parseFloat(up.getForm().get("valor").toString());
        
        String url = "jdbc:postgresql://localhost:5432/WebPage";
        String usuario = "postgres";
        String senhaBD = "123";
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO produtos(nome,descricao,valor,imagem) VALUES('" + nome + "','" + desc + "','" + valor + "','" + imagem + "') ");
            response.sendRedirect("usuarios.jsp?erro=1000");
        } catch (Exception e) {
            out.println(e);
        }
    } else {
    }
%>
<img src="../arquivos/<%=up.getFiles().get(0)%>"  />
