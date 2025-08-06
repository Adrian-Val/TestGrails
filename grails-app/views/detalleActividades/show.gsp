
<%@ page import="db_migrations.DetalleActividades" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <!--<g:set var="entityName" value="${message(code: 'detalleActividades.label', default: 'DetalleActividades')}" />-->
        <title>Mostrar relación de actividad</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-10 d-flex justify-content-start">
                <h3>Detalle actividad</h3>
            </div>
            <div class="col-2 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-warning list" action="index"><i class="fa-solid fa-list"></i> Listado</g:link>
            </div>
        </div>
                
        <div id="show-detalleActividades" class="content scaffold-show" role="main">
            <ul class="property-list detalleActividades">
                <g:if test="${detalleActividadesInstance?.actividades}">
                    <li class="fieldcontain">
                        <span id="actividades-label" class="property-label"><b>Actividad: </b></span>
                        <span class="property-value" aria-labelledby="actividades-label"><g:link controller="actividades" action="show" id="${detalleActividadesInstance?.actividades?.id}">${detalleActividadesInstance?.actividades?.encodeAsHTML()}</g:link></span>
                    </li>
                </g:if>

                <g:if test="${detalleActividadesInstance?.empleados}">
                    <li class="fieldcontain">
                        <span id="empleados-label" class="property-label"><b>Responsable: </b></span>
                        <span class="property-value" aria-labelledby="empleados-label"><g:link controller="empleados" action="show" id="${detalleActividadesInstance?.empleados?.id}">${detalleActividadesInstance?.empleados?.encodeAsHTML()}</g:link></span>
                    </li>
                </g:if>
                
                <g:if test="${detalleActividadesInstance?.estatus}">
                    <li class="fieldcontain">
                        <span id="estatus-label" class="property-label"><b>Estatus: </b></span>
                        <span class="property-value" aria-labelledby="estatus-label"><g:link controller="estatus" action="show" id="${detalleActividadesInstance?.estatus?.id}">${detalleActividadesInstance?.estatus?.encodeAsHTML()}</g:link></span>
                    </li>
                </g:if>
                
                <g:if test="${detalleActividadesInstance?.dateCreated}">
                    <li class="fieldcontain">
                        <span id="dateCreated-label" class="property-label">Fecha de creación: </span>
                        <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate format="dd-MM-yyyy" date="${detalleActividadesInstance?.dateCreated}" /></span>
                    </li>
                </g:if>
                
                <g:if test="${detalleActividadesInstance?.activo}">
                    <li class="fieldcontain">
                        <span id="activo-label" class="property-label"><b>Activo: </b></span>
                        <span class="property-value" aria-labelledby="activo-label"><g:fieldValue bean="${detalleActividadesInstance}" field="activo"/></span>
                    </li>
                </g:if>
                
                <g:if test="${detalleActividadesInstance?.activo != 1}">
                    <li class="fieldcontain">
                        <span id="activo-label" class="property-label"><b>Activo: </b></span>
                        <span class="property-value" aria-labelledby="activo-label"><i class="btn btn-sm btn-danger fa-solid fa-ban"></i></span>
                    </li>
                </g:if>
            </ul>
            
            <g:form url="[resource:detalleActividadesInstance, action:'delete']" id="formDelete" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-plus"></i> Nuevo</g:link>
                    &nbsp;&nbsp;&nbsp;
                    <g:link class="btn btn-primary edit" action="edit" resource="${detalleActividadesInstance}"><i class="fa-solid fa-pen-to-square"></i> Editar</g:link>
                    &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-danger delete" onclick="deleteConfirm()"><i class="fa-solid fa-pen-to-square"></i> Eliminar</button>
                </fieldset>
            </g:form>
        </div>
        
        <g:if test="${flash.message}">
            <script type="text/javascript">
                Swal.fire({
                  text: '${flash.message}',
                  icon: 'success',
                  confirmButtonText: 'OK'
                });
            </script>
        </g:if>
        
        <script>                
            function deleteConfirm(){
                event.preventDefault();
            
                const formDelete = document.getElementById('formDelete');
                
                Swal.fire({
                    text: "¿Estás seguro de eliminar?",
                    icon: "question",
                    showDenyButton: false,
                    showCancelButton: true,
                    confirmButtonText: "Si",
                    cancelButtonText: "Cancelar",
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            text: "Registro eliminado con éxito",
                            icon: "success",
                            confirmButtonText: "OK",
                            allowOutsideClick: false,
                            allowEscapeKey: false,
                        }).then((result) => {
                            if (result.isConfirmed) {
                                formDelete.submit();
                            }
                        });
                    }
                });
            }
        </script>
    </body>
</html>
