<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>


<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String id = request.getParameter("id");
    
    Upload up = new Upload();
    
    up.setFolderUpload("arquivos");
    
    if(up.formProcess(getServletContext(), request)){
    
        String imagem = up.getFiles().get(0);
        String nome = up.getForm().get("nome").toString();
        String descricao = up.getForm().get("descricao").toString();
        Float valor = Float.parseFloat(up.getForm().get("valor").toString());
        
        String url = "jdbc:postgresql://localhost:5432/WebPage";
        String usuario = "postgres";
        String senhaBD = "123";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            st.execute("UPDATE produtos SET nome='"+nome+"', desc='"+descricao+"', valor='"+valor+"', imagem='"+imagem+"' WHERE id='"+id+"' ");
            
            response.sendRedirect("../produtos.jsp?status=1");
        }catch(Exception e){
            out.print(e);
        }
    }
%>
