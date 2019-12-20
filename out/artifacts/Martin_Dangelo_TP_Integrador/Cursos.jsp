<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Lista de Cursos</title>
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
    <jsp:include page="/Componentes/SideBar.jsp"></jsp:include>
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
                            <a class="btn btn-success" href="AltaAlumno.jsp" role="button">Nuevo Curso</a>
                            <h4 class="card-title">Lista Cursos</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="Tabla" class="table table-striped table-no-bordered table-hover" cellspacing="0"
                                       width="100%" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Materia</th>
                                        <th>Semestre</th>
                                        <th>Año</th>
                                        <c:if test="${pageContext.getSession().getAttribute(\"idTipoUsuario\") != 2}">
                                            <th>Docente</th>
                                        </c:if>
                                        <c:if test="${pageContext.getSession().getAttribute(\"idTipoUsuario\") == 2}">
                                            <th class="disabled-sorting text-right"></th>
                                        </c:if>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>Materia</th>
                                        <th>Semestre</th>
                                        <th>Año</th>
                                        <c:if test="${pageContext.getSession().getAttribute(\"idTipoUsuario\") != 2}">
                                            <th>Docente</th>
                                        </c:if>
                                        <c:if test="${pageContext.getSession().getAttribute(\"idTipoUsuario\") == 2}">
                                            <th class="text-right"></th>
                                        </c:if>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="curso" items="${ cursos }">
                                        <tr id="curso-${ curso.getId() }">
                                            <td>${ curso.getMateria().getNombre() }</td>
                                            <td>${ curso.getSemestre() }</td>
                                            <td>${ curso.getAno() }</td>
                                            <c:if test="${pageContext.getSession().getAttribute(\"idTipoUsuario\") != 2}">
                                                <td>${ course.getTeacher() }</td>
                                            </c:if>
                                            <c:if test="${pageContext.getSession().getAttribute(\"idTipoUsuario\") == 2}">
                                                <td>
                                                    <a href="NotasPorCurso.jsp?idcurso=${ curso.getId() }" class='editar btn btn-primary'>
                                                        <i class='fa fa-pencil-square-o'>Cargar Notas</i>
                                                    </a>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
