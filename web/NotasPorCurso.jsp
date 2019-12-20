<%@ page import="Controladores.Controlador" %>
<%@ page import="Dominio.AlumnosPorCurso" %>
<%@ page import="Servicios.AlumnosPorCursosService" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<% Controlador.validarSesion(request,response); %>
<% Integer idCurso = Integer.parseInt(request.getParameter("idcurso"));%>
<% ArrayList<AlumnosPorCurso> alumnosPorCursos = AlumnosPorCursosService.obtenerAlumnos(idCurso);%>
<% request.setAttribute("alumnosPorCursos",alumnosPorCursos);%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76"
          href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Cargar Notas</title>
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

                            <h4 class="card-title">Lista Cursos</h4>
                        </div>
                        <form action="cursos" method="POST">
                            <input type="hidden" name="idCurso" value="<%=idCurso%>">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="TablaAlumnos" class="table table-bordered"
                                           style="width: 100%">
                                        <thead>
                                        <tr>
                                            <th>Legajo</th>
                                            <th>Nombre y Apellido</th>
                                            <th>Situacion</th>
                                            <th>Nota 1</th>
                                            <th>Nota 2</th>
                                            <th>Recu 1</th>
                                            <th>Recu 2</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="alumnosPorCurso" items="${ alumnosPorCursos }">
                                            <tr >
                                                <td>${ alumnosPorCurso.getAlumno().getLegajo() }</td>
                                                <td>${ alumnosPorCurso.getAlumno().getNombre() }</td>
                                                <td>${ alumnosPorCurso.getAlumno().getApellido() }</td>
                                                <td><select size="1" name="condicion-${alumnosPorCurso.getAlumno().getLegajo()}">
                                                    <option value="R" ${alumnosPorCurso.getCondicion().equals("R")?"seleted": ""}>
                                                        Regular
                                                    </option>
                                                    <option value="L" ${alumnosPorCurso.getCondicion().equals("L")?"seleted": ""}>
                                                        Libre</option>
                                                </select></td>
                                                <td><input type="number" min="0" max="10" value="${alumnosPorCurso.getP1()}"
                                                           name="P1-${alumnosPorCurso.getAlumno().getLegajo()}"></td>
                                                <td><input type="number" min="0" max="10" value="${alumnosPorCurso.getP2()}"
                                                           name="P2-${alumnosPorCurso.getAlumno().getLegajo()}"></td>
                                                <td><input type="number" min="0" max="10" value="${alumnosPorCurso.getR1()}"
                                                           name="R1-${alumnosPorCurso.getAlumno().getLegajo()}"></td>
                                                <td><input type="number" min="0" max="10" value="${alumnosPorCurso.getR2()}"
                                                           name="R2-${alumnosPorCurso.getAlumno().getLegajo()}"></td>
                                            </tr>
                                            <input type="hidden" name="alumnos[]" value="${ alumnosPorCurso.getAlumno().getLegajo() }">
                                        </c:forEach>
                                        </tbody>

                                    </table>

                                </div>
                                <div class="col-md-12 pr-1">
                                    <div class="form-group">
                                        <label></label>
                                        <input type="hidden" name="accion" value="cargar">
                                        <button type="submit"
                                                class="btn btn-outline-success btn-lg btn-block">Cargar Notas
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
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

        </div>
    </div>
    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!--  Google Maps Plugin    -->

    <!-- Chart JS -->
    <script src="assets/js/plugins/chartjs.min.js"></script>
    <!--  Notifications Plugin    -->

    <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="assets/js/now-ui-dashboard.min.js?v=1.3.0"
            type="text/javascript"></script>
    <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
    <script src="assets/demo/demo.js"></script>
    <script src="assets/js/jquery-3.3.1.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script src="assets/js/funciones.js"></script>
</body>

</html>
tml>