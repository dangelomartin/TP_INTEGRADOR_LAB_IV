<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar" data-color="orange">

    <div class="logo">
        <a href="#" class="simple-text logo-mini"> UTN </a> <a href="#"
                                                               class="simple-text logo-normal"> ADMINISTRACION </a>
    </div>
    <div class="sidebar-wrapper" id="sidebar-wrapper">
        <ul class="nav">
            <c:if test="${pageContext.getSession().getAttribute(\"idTipoUsuario\") == 1}">
                <li><a href="http://localhost:8084/Martin_Dangelo_TP_Integrador/estadisticas"> <i
                        class="now-ui-icons design_app"></i>
                    <p>Estadistica</p>
                </a></li>
                <li><a href="http://localhost:8084/Martin_Dangelo_TP_Integrador/docentes"> <i
                        class="now-ui-icons design_bullet-list-67"></i>
                    <p>Lista Docentes</p>
                </a></li>
                <li><a href="http://localhost:8084/Martin_Dangelo_TP_Integrador/alumnos"> <i
                        class="now-ui-icons design_bullet-list-67"></i>
                    <p>Lista Alumnos</p>
                </a></li>
            </c:if>
            <li><a href="cursos"> <i
                    class="now-ui-icons design_bullet-list-67"></i>
                <p>Lista Cursos</p>
            </a></li>
            <li><a href="login"> <i
                    class="now-ui-icons users_single-02"></i>
                <p>Cerra Sesion</p>
            </a></li>
        </ul>
    </div>
</div>