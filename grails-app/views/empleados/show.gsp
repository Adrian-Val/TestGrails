
<%@ page import="db_migrations.Empleados" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <!--<g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />-->
        <title>Mostrar empleado</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-10 d-flex justify-content-start">
                <h3>Detalle empleado</h3>
            </div>
            <div class="col-2 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-warning list" action="index"><i class="fa-solid fa-list"></i> Listado</g:link>
            </div>
        </div>
        
        <div class="card mt-3">
            <div id="show-empleados" class="content scaffold-show card-body" role="main">                   
                <ul class="property-list empleados">
                    <g:if test="${empleadosInstance?.nombre}">
                        <li class="fieldcontain">
                            <span id="nombre-label" class="property-label"><b>Nombre: </b></span>
                            <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${empleadosInstance}" field="nombre"/></span>
                        </li>
                    </g:if>
                    
                    <g:if test="${empleadosInstance?.ap_paterno}">
                        <li class="fieldcontain">
                            <span id="ap_paterno-label" class="property-label"><b>Apellido paterno: </b></span>
                            <span class="property-value" aria-labelledby="ap_paterno-label"><g:fieldValue bean="${empleadosInstance}" field="ap_paterno"/></span>
                        </li>
                    </g:if>
                    
                    <g:if test="${empleadosInstance?.ap_materno}">
                        <li class="fieldcontain">
                            <span id="ap_materno-label" class="property-label"><b>Apellido materno: </b></span>
                            <span class="property-value" aria-labelledby="ap_materno-label"><g:fieldValue bean="${empleadosInstance}" field="ap_materno"/></span>
                        </li>
                    </g:if>

                    <g:if test="${empleadosInstance?.cargo}">
                        <li class="fieldcontain">
                            <span id="cargo-label" class="property-label"><b>Cargo: </b></span>
                            <span class="property-value" aria-labelledby="cargo-label"><g:fieldValue bean="${empleadosInstance}" field="cargo"/></span>
                        </li>
                    </g:if>
                    
                    <g:if test="${empleadosInstance?.activo}">
                        <li class="fieldcontain">
                            <span id="activo-label" class="property-label"><b>Activo: </b></span>
                            <span class="property-value" aria-labelledby="activo-label"><i class="btn btn-sm btn-success fa-solid fa-circle-check"></i></span>
                        </li>
                    </g:if>
                    
                    <g:if test="${empleadosInstance?.activo != 1}">
                        <li class="fieldcontain">
                            <span id="activo-label" class="property-label"><b>Activo: </b></span>
                            <span class="property-value" aria-labelledby="activo-label"><i class="btn btn-sm btn-danger fa-solid fa-ban"></i></span>
                        </li>
                    </g:if>
                    
                    <g:if test="${empleadosInstance?.dateCreated}">
                        <li class="fieldcontain">
                            <span id="dateCreated-label" class="property-label"><b>Fecha de creación: </b></span>
                            <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate format="dd-MM-yyyy" date="${empleadosInstance?.dateCreated}" /></span>
                        </li>
                    </g:if>
                </ul>
                
                <hr/>
                
                <g:form url="[resource:empleadosInstance, action:'delete']" method="DELETE" id="formDelete">
                    <fieldset class="buttons">
                        <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-plus"></i> Nuevo</g:link>
                        &nbsp;&nbsp;&nbsp;
                        <g:link class="btn btn-info edit" action="edit" resource="${empleadosInstance}"><i class="fa-solid fa-pen-to-square"></i> Editar</g:link>
                        &nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-danger delete" onclick="deleteConfirm()"><i class="fa-solid fa-pen-to-square"></i> Eliminar</button>
                    </fieldset>
                </g:form>
            </div>
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
