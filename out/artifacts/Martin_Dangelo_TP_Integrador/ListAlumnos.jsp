<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <a class="btn btn-success" href="AltaAlumno.jsp" role="button">Agregar
                                Alumno</a>
                            <h4 class="card-title">Lista Alumnos</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="Tabla" class="table table-bordered"
                                       style="width: 100%">
                                    <thead>
                                    <tr>
                                        <th>Legajo</th>
                                        <th>DNI</th>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Fecha Nacimiento</th>
                                        <th>Direccion</th>
                                        <th>Localidad</th>
                                        <th>Provincia</th>
                                        <th>Email</th>
                                        <th>Telefono</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="usuario" items="${ usuarios }">
                                        <tr id="usuario-${ usuario.getLegajo() }">
                                            <td>${ usuario.getLegajo() }</td>
                                            <td>${ usuario.getDni() }</td>
                                            <td>${ usuario.getNombre() }</td>
                                            <td>${ usuario.getApellido() }</td>
                                            <td>${ usuario.getFechaNac() }</td>
                                            <td>${ usuario.getDireccion() }</td>
                                            <td>${ usuario.getLocalidad().getNombre() }</td>
                                            <td>${ usuario.getProvincia().getNombre() }</td>
                                            <td>${ usuario.getEmail() }</td>
                                            <td>${ usuario.getTelefono() }</td>
                                            <td>
                                                <a href="ModAlumno.jsp?legajo=${ usuario.getLegajo() }" class='editar btn btn-primary'>
                                                    <i class='fa fa-pencil-square-o'>Editar</i>
                                                </a>
                                                <button onclick="eliminar(${ usuario.getLegajo() })" class="eliminar btn btn-danger">
                                                    <i class="fa fa-trash-o">Eliminar</i>
                                                </button>
                                            </td>
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
<script src="assets/js/plugins/sweetalert2.js"></script>
<script>
    eliminar = legajo => {
        Swal.fire({
            title: '¿Está seguro de eliminar al alumno?',
            text: "No podrá revertir la acción",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#52af50',
            cancelButtonColor: '#ea4a64',
            cancelButtonText: 'Cancelar',
            confirmButtonText: '¡Si, elimínalo!'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: 'alumnos/elimnar?legajo=' + legajo,
                    type: 'DELETE',
                    data: {
                        legajo: legajo
                    },
                    success: function (data) {
                        if (! data) return handleError();
                        if (data.status === 200) return handleSuccess(legajo);
                    }
                });
            }
        });
    };

    handleSuccess = legajo => {
        $('#Tabla').DataTable().rows('#usuario-' + legajo).remove().draw();
        Swal.fire({
            icon: 'success',
            title: '¡Eliminado!',
            text: 'El alumno ha sido eliminado.',
            confirmButtonColor: '#52af50',
        })
    };
    handleError = () => {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '¡Algo ha salido mal!',
            confirmButtonColor: '#52af50',
        })
    };
</script>
</body>

</html>
