
<%@ page import="db_migrations.Estatus" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <!--<g:set var="entityName" value="${message(code: 'estatus.label', default: 'Estatus')}" />-->
        <title>Mostrar estatus</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-10 d-flex justify-content-start">
                <h3>Mostrar estatus</h3>
            </div>
            <div class="col-2 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-warning list" action="index"><i class="fa-solid fa-list"></i> Listado</g:link>
            </div>
        </div>

        <div class="card mt-3">
            <div id="show-estatus" class="content scaffold-show card-body" role="main">
                <ul class="property-list estatus">
                    <g:if test="${estatusInstance?.nombre}">
                        <li class="fieldcontain">
                            <span id="nombre-label" class="property-label"><b>Nombre: </b></span>
                            <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${estatusInstance}" field="nombre"/></span>
                        </li>
                    </g:if>

                    <g:if test="${estatusInstance}">
                        <li class="fieldcontain">
                            <span id="activo-label" class="property-label"><b>Activo: </b></span>
                            <span class="property-value" aria-labelledby="activo-label"><i class="btn btn-sm ${estatusInstance.activo == 1 ? 'btn-success fa-circle-check' : 'btn-danger fa-ban'} fa-solid"></i></span>
                        </li>
                    </g:if>
                    
                    <g:if test="${estatusInstance?.dateCreated}">
                        <li class="fieldcontain">
                            <span id="dateCreated-label" class="property-label"><b>Fecha de creación: </b></span>
                            <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate format="dd-MM-yyyy" date="${estatusInstance?.dateCreated}" /></span>
                        </li>
                    </g:if>                   
                </ul>

                <!--<g:form url="[resource:estatusInstance, action:'delete']" method="DELETE" id="formDelete">-->
                    <fieldset class="buttons">
                        <hr>
                        <div class="row mt-3">
                            <div class="col-12">
                                <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-circle-plus"></i> Nuevo</g:link>
                                &nbsp;&nbsp;&nbsp;
                                <g:link class="btn btn-primary edit" action="edit" resource="${estatusInstance}"><i class="fa-solid fa-pen-to-square"></i> Editar</g:link>
                                &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" onclick="abrirModalEliminacion()"><i class="fa-solid fa-trash"></i> Eliminar</button>
                            </div>
                        </div>
                    </fieldset>
                <!--</g:form>-->
            </div>
        </div>
        
        
        <div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Título del Modal</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <g:form url="[resource:estatusInstance, action:'borrarEstatus']" method="POST" id="formDelete">
                            <div class="mb-3 fieldcontain">
                                <label class="form-label" for="activo">
                                    <b>Motivo: </b><span class="required-indicator text-danger">*</span>
                                </label>
                                <g:textArea name="motivo" class="form-control" value=""/>
                            </div>
                            
                            <button type="button" class="btn btn-danger delete" onclick="deleteConfirm()"><i class="fa-solid fa-pen-to-square"></i> Eliminar</button>
                        </g:form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
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
            <!--Cargamos la modal y reseteamos el form-->
            function abrirModalEliminacion() {
                const modal = new bootstrap.Modal(document.getElementById('modalDelete'));
                const form = document.getElementById('formDelete');
                form.reset();

                modal.show();
            }

            <!--Eliminamos el registro-->
            function deleteConfirm(){
                event.preventDefault();
                
                const motivo = document.getElementById("motivo").value.trim();

                if (!motivo) {
                    alert("El campo 'motivo' es obligatorio.");
                    return;
                }
            
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
                        formDelete.submit();   
                    }
                });
            }
        </script>
    </body>
</html>
