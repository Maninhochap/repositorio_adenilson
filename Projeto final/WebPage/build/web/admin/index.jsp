<%-- 
    Document   : index
    Created on : 26 de nov. de 2022, 17:56:39
    Author     : vanes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
            <div class="container-fluid">
                <form action="config/trataLogin.jsp" method="post">
                    <div class="mb-3">
                        <h1>Faça seu login</h1>
                     <label for="exampleInputEmail1" class="form-label">Email</label>
                     <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                     <div id="emailHelp" class="form-text">Nunca compartilhe seu e-mail com mais ninguém.</div>
                    </div>
                    <div class="mb-3">
                     <label for="exampleInputPassword1" class="form-label">Senha</label>
                     <input type="password" name="senha" class="form-control" id="exampleInputPassword1">
                    </div>
                    
                   <button type="submit" class="btn btn-primary">Entrar</button>
                   <button type="submit" class="btn btn-dark">Cadastre-se</button>
                 </form>
            </div>
    </body>
            
            
</html>
