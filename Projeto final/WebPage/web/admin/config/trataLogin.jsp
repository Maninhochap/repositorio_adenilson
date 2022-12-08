
<%@page import="java.sql.*" %>
<%@page import="org.postgresql.Driver" %>

<%
    Connection con = null;
    Statement st =null;//instanciando Statement para executar QUERIS
    ResultSet rs = null;//instanciando ResultSet para navegar entre registros retornados
    
    String email = request.getParameter("email");//armazenando na variavel email o que foi digitado no form do email
    String senha = request.getParameter("senha");//armazenando na variavel email o que foi digitado no form do senha
    String user = null;
    String pass = "";
    String NomeUser = "";
    
    if(email =="" || senha == ""){//Verifica se possui campos em brancos
        response.sendRedirect("../index.jsp?erro=1");//Retorna para o login
    }else{
        try{
            String url = "jdbc:postgresql://localhost:5432/WebPage";
            String usuario ="postgres";
            String senhaBD ="123";

            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            rs = st.executeQuery("SELECT *FROM usuarios WHERE email = '"+email+"' AND senha = '"+senha+"' ");
            while(rs.next()){
                user = rs.getString(3);//Armazenando o email do banco
                pass = rs.getString(5);//Armazenando a senha do banco
                NomeUser = rs.getString(2);//Armazenando o nome do banco
            }
        }catch(Exception e){//vverifica se possui excessão erro da classe de conecção com o banco
        out.print(e);//printa o erro
        }
        if(email.equals(user) && senha.equals(pass)){
            session.setAttribute("NomeUsuario", NomeUser);// cria a sessão com o nome usuario
            response.sendRedirect("../home.jsp");//redireciona para a pagna inicial admin
        }else{
            response.sendRedirect("../index.jsp?erro=2");//usuario ou senha invalidos.
        }
    }
%>