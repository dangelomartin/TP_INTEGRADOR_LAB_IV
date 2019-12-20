<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/EstiloLogin.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container well" id="containerLogin">

    <center><img alt="" src="assets/img/User.png"></center>


    <form id="formlogin" method="post" action="">

        <div class="form-group">
            <input name="email" type="text" class="form-control" id="inputUser" placeholder="Usuario">
        </div>
        <div class="form-group">
            <input name="pass" type="password" class="form-control" id="inputPass" placeholder="Password">
        </div>
        <button type="submit" class="btn btn-primary btn-lg btn-block">Ingresar</button>

    </form>
</div>
</body>
</html>