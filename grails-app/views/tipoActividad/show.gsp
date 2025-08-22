
<%@ page import="db_migrations.TipoActividad" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <!--<g:set var="entityName" value="${message(code: 'tipoActividad.label', default: 'TipoActividad')}" />-->
        <title>Mostrar tipo de actividad</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-10 d-flex justify-content-start">
                <h3>Tipo de actividad</h3>
            </div>
            <div class="col-2 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-warning list" action="index"><i class="fa-solid fa-list"></i> Listado</g:link>
            </div>
        </div>
        
        <!--<g:if test="${flash.message}">-->
            <div class="card mt-3">
                <div class="card-body">
                    <h5 class="card-title"><b>Correo electrónico</b></h5><hr>

                    <!--<div class="row">
                        <div class="col-8"><p id="subjectMail">Usuario para generar cita en área de consulta.</p></div>
                        <div class="col-4 d-flex justify-content-end">
                            <button class="btn btn-primary" id="copySubjectEmail"><i class="fa-solid fa-copy"></i> Copiar</button>
                        </div>
                    </div>

                    <hr>-->

                    <div class="row">
                        <div class="col-12" id="bodyEmail">
                            <p>Se verificaron los datos proporcionados en la plataforma de Citas IFREM y se generó su usuario con éxito.</p>                        
                            <p>
                                <b>Usuario: </b> ${tipoActividadInstance.nombre}
                                <br>
                                <b>Contraseña: </b> ${tipoActividadInstance.nombre}
                            </p>
                            <p>Para iniciar sesión ingresar a la liga <b> http://plataforma.ifrem.gob.mx:8081/citasWeb/login/auth </b> en el apartado de <b> "Citas para el Área de Consulta en las Oficinas Registrales".</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <button class="btn btn-primary" id="copyBodyEmail"><i id="iconCopy" class="fa-solid fa-copy"></i> Copiar</button>
                        </div>
                    </div>
                </div>
            </div>
        <!--</g:if>-->
        
        <div class="card mt-3">
            <div id="show-tipoActividad" class="content scaffold-show card-body" role="main">                
                <ul class="property-list tipoActividad">
                    <g:if test="${tipoActividadInstance?.nombre}">
                        <li class="fieldcontain">
                            <span id="nombre-label" class="property-label"><b>Nombre: </b></span>
                            <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tipoActividadInstance}" field="nombre"/></span>
                        </li>
                    </g:if>

                    <g:if test="${tipoActividadInstance?.dateCreated}">
                        <li class="fieldcontain">
                            <span id="dateCreated-label" class="property-label"><b>Fecha de creación: </b></span>
                            <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate format="dd-MM-yyyy" date="${tipoActividadInstance?.dateCreated}" /></span>
                        </li>
                    </g:if>

                    <g:if test="${tipoActividadInstance?.activo}">
                        <li class="fieldcontain">
                            <span id="activo-label" class="property-label"><b>Activo: </b></span>
                            <span class="property-value" aria-labelledby="activo-label"><i class="btn btn-sm btn-success fa-solid fa-circle-check"></i></span>
                        </li>
                    </g:if>
                    
                    <g:if test="${tipoActividadInstance?.activo != 1}">
                        <li class="fieldcontain">
                            <span id="activo-label" class="property-label"><b>Activo: </b></span>
                            <span class="property-value" aria-labelledby="activo-label"><i class="btn btn-sm btn-danger fa-solid fa-ban"></i></span>
                        </li>
                    </g:if>
                </ul>

                <g:form url="[resource:tipoActividadInstance, action:'delete']" id="formDelete" method="DELETE">
                    <fieldset class="buttons">
                        <hr>
                        <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-plus"></i> Nuevo</g:link>
                        &nbsp;&nbsp;&nbsp;
                        <g:link class="btn btn-warning edit" action="edit" resource="${tipoActividadInstance}"><i class="fa-solid fa-pen-to-square"></i> Editar</g:link>
                        &nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-danger delete" onclick="deleteConfirm()"><i class="fa-solid fa-pen-to-square"></i> Eliminar</button>
                    </fieldset>
                </g:form>
            </div>
        </div>
        
        <!--<g:if test="${flash.message}">
            <script type="text/javascript">
                Swal.fire({
                  text: '${flash.message}',
                  icon: 'success',
                  confirmButtonText: 'OK'
                });
            </script>
        </g:if>-->
        
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
            
            <!-- COPY TO CLIPBOARD -->
            document.addEventListener('DOMContentLoaded', () => {
                const textToCopyElement = document.getElementById('bodyEmail');
                const copyButton = document.getElementById('copyBodyEmail');
                const iconCopy = document.getElementById('iconCopy');

                if (copyButton && textToCopyElement) {
                    copyButton.addEventListener('click', async () => {
                    const text = textToCopyElement.innerText;

                    try {
                        await navigator.clipboard.writeText(text);
                    } catch (err) {
                        console.error('Ocurrió un error: ', e);
                        alert('Error al copiar texto. Por favor intenta de nuevo o copia manualmente.');
                    }
                });
            }
        });
        </script>
    </body>
</html>
