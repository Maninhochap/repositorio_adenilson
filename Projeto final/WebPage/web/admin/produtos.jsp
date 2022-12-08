<%-- 
    Document   : produtos
    Created on : 26 de nov. de 2022, 17:57:15
    Author     : vanes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%
            String nomeUsuario = (String) session.getAttribute("NomeUsuario");
                if(nomeUsuario == null){
                    response.sendRedirect("../index.jsp?erro=3");     
                }
        %>

        <jsp:include page="includes/nav.jsp"/>
        <div id="layoutSidenav">
            <jsp:include page="includes/sidenav.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Produtos</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Cadastrar Produtos</li>
                        </ol>
                    </div>
                    <div class="container-fluid px-4">
                        <small>Formulário de cadastro de produtos</small>
                        <form action="config/cadastroProdutos.jsp" method="POST" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label class="form-label">Nome do produto</label>
                                <input type="text" class="form-control" name="nome" placeholder="Nome do produto" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Descrição</label>
                                <input type="text" class="form-control" name="desc" placeholder="Descrição do produto" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Valor</label>
                                <input type="text" class="form-control" name="valor" placeholder="Valor do produto" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Imagem</label>
                                <input type="file" class="form-control" name="files[]" multiple />
                            </div>
                            <button type="submit" class="btn btn-primary" >Cadastrar</button>
                        </form>
                    </div>
                    
                    <div class="container-fluid px-4">
                        <hr>
                        <small>Produtos cadastrados</small>
                        <hr>
                        <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Nome</th>
                                            <th>Descrição</th>
                                            <th>Valor</th>
                                            <th>Imagem</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Nome</th>
                                            <th>Descrição</th>
                                            <th>Valor</th>
                                            <th>Imagem</th>
                                            <th>Ações</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%

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
                                            rs= st.executeQuery("SELECT *FROM produtos");
                                            while(rs.next()){ 
                                            String id = rs.getString(1);
                                    %>
                                        <tr>
                                            <td><%=rs.getString("nome")%></td>
                                            <td><%=rs.getString("descricao")%></td>
                                            <td><%=rs.getString("valor")%></td>
                                            <td><img src="../arquivos/<%=rs.getString("imagem")%>" width="100"/></td>
                                            <td>
                                                <a href="" class="text-info" data-bs-toggle="modal" data-bs-target="#modalEditar<%out.print(id);%>"><i class="fa fa-pencil-square"></i></a>
                                                <a href="" class="text-danger" data-bs-toggle="modal" data-bs-target="#exampleModal<%out.print(id);%>"><i class="fa fa-trash"></i></a>
                                                   
                                            </td>
                                        </tr>
                                        <!-- Modal Editar-->
                                    <div class="modal fade" id="modalEditar<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Editar produtos</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                          </div>

                                            <!--Formulário Modal Editar-->
                                            <form action="./config/cadastroProdutos.jsp?id=<% out.print(id);%>" method="POST" enctype="multipart/form-data">
                                              <div class="modal-body">
                                                  <div class="mb-3">
                                                    <label for="name" class="form-label">Nome</label>
                                                    <input type="text" name="nome" value="<%=rs.getString(2)%>" class="form-control">
                                                  </div>
                                                  <div class="mb-3">
                                                    <label for="text" class="form-label">Descrição</label>
                                                    <input type="text" name="desc" value="<%=rs.getString(3)%>" class="form-control">
                                                  </div>
                                                  <div class="mb-3">
                                                    <label for="telefone" class="form-label">Valor</label>
                                                    <input type="text" name="valor" value="<%=rs.getString(4)%>" class="form-control">
                                                  </div>
                                                  <div class="mb-3">
                                                    <label class="form-label">Imagem</label>
                                                    <input type="file" class="form-control" name="files[]" value="<%=rs.getString("imagem")%>" multiple />
                                                  </div>
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="btn btn-primary">Editar</button>
                                                  </div>
                                              </div>
                                          </form>

                                        </div>
                                      </div>
                                    </div>
                                                    <!-- Modal Excluir-->
                                    <div class="modal fade" id="exampleModal<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Excluir produtos</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                          </div>
                                          <div class="modal-body">
                                            Tem certeza que deseja excluir o produto <%=rs.getString(2)%>?
                                          </div>
                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                            <a href="produtos.jsp?funcao=excluir&id=<%=rs.getString(1)%>" class="btn btn-danger">Excluir</a>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    </tbody>
                                    <%}
                                        }catch(Exception e){
                                        out.print(e);
                                        }
                                    %>
                    </table>
                    </div>
                </main>
                <jsp:include page="includes/footer.jsp"/>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simples-demo.js"></script>
        
        <%
            if(request.getParameter("funcao")!= null && request.getParameter("funcao").equals("excluir")){
                String id = request.getParameter("id");
                try{
                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection(url,usuario,senhaBD);
                    st = con.createStatement();
                    st.executeUpdate("DELETE FROM produtos WHERE id='"+id+"' ");
                    response.sendRedirect("produtos.jsp?erro=2");
                }catch(Exception e){
                out.println(e);
                }
            }
            
        %>
    </body>
</html>
