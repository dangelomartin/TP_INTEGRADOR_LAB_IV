<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Servicios.MateriaService" %>
<%@ page import="Servicios.UserService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
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
                            <h5 class="title">Datos del Alumno</h5>
                        </div>
                        <div class="card-body">
                            <form action="cursos" method="POST">
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Semestre</label>
                                            <select name="semestre" id="">
                                                <option value="1">Primer Semestre</option>
                                                <option value="2">Segundo Semestre</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Materia</label>
                                            <select name="materia">
                                                <c:forEach var="materia" items="${ MateriaService.list() }">
                                                    <option value="${ materia.getId() }">
                                                            ${ materia.getNombre() }
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table id="Tabla" class="table table-bordered"
                                               style="width: 100%">
                                            <thead>
                                            <tr>
                                                <th>Legajo</th>
                                                <th>DNI</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Email</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="usuario" items="${ UserService.obtenerUsuarios(2) }">
                                                <tr id="usuario-${ usuario.getLegajo() }">
                                                    <td>${ usuario.getLegajo() }</td>
                                                    <td>${ usuario.getDni() }</td>
                                                    <td>${ usuario.getNombre() }</td>
                                                    <td>${ usuario.getApellido() }</td>
                                                    <td>${ usuario.getEmail() }</td>
                                                    <td>
                                                        <input type="radio" name="docente[]" value="${usuario.getLegajo()}">
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table id="Tabla2" class="table table-bordered"
                                               style="width: 100%">
                                            <thead>
                                            <tr>
                                                <th>Legajo</th>
                                                <th>DNI</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Email</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="usuario" items="${ UserService.obtenerUsuarios(3) }">
                                                <tr id="usuario-${ usuario.getLegajo() }">
                                                    <td>${ usuario.getLegajo() }</td>
                                                    <td>${ usuario.getDni() }</td>
                                                    <td>${ usuario.getNombre() }</td>
                                                    <td>${ usuario.getApellido() }</td>
                                                    <td>${ usuario.getEmail() }</td>
                                                    <td>
                                                        <input type="checkbox" name="alumnos[]" value="${usuario.getLegajo()}">
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">

                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label></label>
                                            <button type="submit"
                                                    class="btn btn-outline-success btn-lg btn-block">Añadir
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