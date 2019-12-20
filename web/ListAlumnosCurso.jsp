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

    <link href="assets/css/jquery.dataTables.min.css" rel="stylesheet">


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

                            <h4 class="card-title">Selecciones Los Alumnos que desee
                                Agregar Al Curso</h4>
                            <button id="btnAceptar" type="button"
                                    class="btn btn-primary btn-lg btn-block">Agregar
                                Alumnos Seleccionados Al Curso
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="TablaAlumnosCurso" class="display"
                                       style="width: 100%">
                                    <thead>
                                    <tr>
                                        <th>Legajo</th>
                                        <th>Nombre y Apellido</th>
                                        <th>Fecha Nacimiento</th>
                                        <th>Direccion</th>
                                        <th>Localidad</th>
                                        <th>Provincia</th>
                                        <th>Email</th>
                                        <th>Telefono</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th>123456</th>
                                        <th>Martin Dangelo</th>
                                        <th>09/09/1966</th>
                                        <th>Avenida 123</th>
                                        <th>San Fernando</th>
                                        <th>Bs As</th>
                                        <th>martin@alumno.com</th>
                                        <th>159999999</th>

                                    </tr>
                                    <tr>
                                        <th>123456</th>
                                        <th>Alexis Segovia</th>
                                        <th>09/09/1966</th>
                                        <th>Avenida 123</th>
                                        <th>San felipe</th>
                                        <th>Bs As</th>
                                        <th>alexis@alumno.com</th>
                                        <th>15123531</th>

                                    </tr>
                                    <tr>
                                        <th>123456</th>
                                        <th>Martin Dangelo</th>
                                        <th>09/09/1966</th>
                                        <th>Avenida 123</th>
                                        <th>San Fernando</th>
                                        <th>Bs As</th>
                                        <th>martin@alumno.com</th>
                                        <th>159999999</th>

                                    </tr>
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
        <div class="ps__rail-y"
             style="top: 165px; right: 0px; height: 667px;">
            <div class="ps__thumb-y" tabindex="0"
                 style="top: 107px; height: 434px;"></div>
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
