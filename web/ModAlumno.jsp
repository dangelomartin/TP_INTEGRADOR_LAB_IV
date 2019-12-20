<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Dominio.Alumno" %>
<%@ page import="Dominio.Usuario" %>
<%@ page import="Servicios.UserService" %>
<%@ page import="Servicios.UbicacionService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<% Integer legajo = Integer.parseInt(request.getParameter("legajo"));%>
<% Usuario usuario = UserService.usuarioLegajo(legajo,3);%>
<% request.setAttribute("user",usuario);%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76"
          href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Lista de Alumnos</title>
    <meta
            content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
            name='viewport'/>
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
          crossorigin="anonymous">
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/css/now-ui-dashboard.css?v=1.3.0" rel="stylesheet"/>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/demo/demo.css" rel="stylesheet"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet">
</head>

<body class="">
<div class="wrapper ">
    <jsp:include page="Componentes/SideBar.jsp"/>
    <div class="main-panel" id="main-panel">
        <!-- Navbar -->
        <nav
                class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <div class="navbar-toggle">
                        <button type="button" class="navbar-toggler">
                            <span class="navbar-toggler-bar bar1"></span> <span
                                class="navbar-toggler-bar bar2"></span> <span
                                class="navbar-toggler-bar bar3"></span>
                        </button>
                    </div>

                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navigation" aria-controls="navigation-index"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar navbar-kebab"></span> <span
                        class="navbar-toggler-bar navbar-kebab"></span> <span
                        class="navbar-toggler-bar navbar-kebab"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end"
                     id="navigation"></div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="panel-header panel-header-sm"></div>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <a class="btn btn-primary" href="ListAlumnos.jsp" role="button">Volver</a>
                            <h5 class="title">Modificar Alumno</h5>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="alumnos">
                                <div class="row">
                                    <div class="col-md-12 pr-1">
                                        <div class="form-group">
                                            <input type="hidden" name="legajo" value="${user.getLegajo()}">
                                            <label>Legajo</label> <input type="text"
                                                                         class="form-control"
                                                                         disabled
                                                                         placeholder="Nombre" required
                                                                         value="${user.getLegajo()}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Nombre</label> <input name="nombre" type="text"
                                                                         class="form-control"
                                                                         placeholder="Nombre" required
                                                                         value="${user.getNombre()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Apellido</label>
                                            <input name="apellido" type="text"
                                                   class="form-control"
                                                   placeholder="Apellido" required
                                                   value="${user.getApellido()}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>DNI</label> <input name="dni" type="number"
                                                                      class="form-control"
                                                                      placeholder="DNI" required
                                                                      value="${user.getDni()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label for="email">Email address</label> <input
                                                name="email" id="email"
                                                type="email" class="form-control" placeholder="Email"
                                                required
                                                value="${user.getEmail()}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Fecha Nacimiento</label> <input name="fechanac" type="date"
                                                                                   class="form-control" required
                                                                                   value="${user.getFechaNac()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Telefono</label> <input type="tel" name="telefono"
                                                                           pattern="[0-9]*" maxlength="20" required
                                                                           class="form-control" placeholder="Telefono"
                                                                           value="${user.getTelefono()}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Direccion</label> <input name="direccion" type="text"
                                                                            class="form-control" placeholder="Direccion"
                                                                            maxlength="40"
                                                                            required
                                                                            value="${user.getDireccion()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Localidad</label>
                                            <select name="localidad" >
                                                <c:forEach var="localidad" items="${ UbicacionService.obtenerLocalidades() }">
                                                    <option ${localidad.getId()==user.getLocalidad().getId() ? "selected" : ""}
                                                            value="${ localidad.getId() }">
                                                            ${ localidad.getNombre() }
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Provincia</label>

                                            <select name="provincia" >
                                                <c:forEach var="provincia" items="${ UbicacionService.obtenerProvincias() }">
                                                <option ${provincia.getId()==user.getProvincia().getId() ? "selected" : ""}
                                                        value="${ provincia.getId() }">
                                                        ${ provincia.getNombre() }
                                                </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label></label>
                                            <input type="hidden" value="editar" name="accion">
                                            <button type="submit"
                                                    class="btn btn-outline-success btn-lg btn-block">Modificar
                                                Alumno
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <nav></nav>

            </div>
        </footer>
        <div class="ps__rail-x" style="left: 0px; bottom: -165px;">
            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
        </div>
        <div class="ps__rail-y"
             style="top: 165px; right: 0px; height: 667px;">
            <div class="ps__thumb-y" tabindex="0"
                 style="top: 107px; height: 434px;"></div>
        </div>
    </div>
</div>

<script src="assets/js/core/jquery.min.js"></script>
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script src="assets/js/plugins/chartjs.min.js"></script>
<script src="assets/js/now-ui-dashboard.min.js?v=1.3.0"
        type="text/javascript"></script>
<script src="assets/demo/demo.js"></script>
<script src="assets/js/jquery-3.3.1.js"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
<script src="assets/js/funciones.js"></script>
</body>

</html>