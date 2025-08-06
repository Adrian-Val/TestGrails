
<%@ page import="db_migrations.Empleados" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />
        <title>Empleados</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-6 d-flex justify-content-start">
                <h3>Empleados</h3>
            </div>
            <div class="col-6 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-plus"></i> Nuevo</g:link>
            </div>
        </div>
        
        <hr/>
        
        <div id="list-empleados" class="content scaffold-list" role="main">
            <table class="table table-striped table-hover" id="tblEmpleados">
                <thead class="table-dark">
                    <tr>
                        <th class="text-center" width="10px">#</th>
                        <th>Nombre</th>
                        <th>Cargo</th>
                        <th>Activo</th>
                        <th>Fecha de creación</th>
                        <th>Ver</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${empleadosInstanceList}" status="i" var="empleadosInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td class="text-center">${i + 1}</td>
                            <td>
                                ${fieldValue(bean: empleadosInstance, field: "nombre")}
                                ${fieldValue(bean: empleadosInstance, field: "ap_materno")}
                                ${fieldValue(bean: empleadosInstance, field: "ap_paterno")}
                            </td>
                            <td>${fieldValue(bean: empleadosInstance, field: "cargo")}</td>
                            <td>
                                <g:if test="${empleadosInstance?.activo}">
                                    <i class="btn btn-success fa-solid fa-circle-check"></i>
                                </g:if>
                                
                                <g:if test="${empleadosInstance?.activo != 1}">
                                    <i class="btn btn-danger fa-solid fa-ban"></i>
                                </g:if>    
                            </td>
                            <td><g:formatDate date="${empleadosInstance.dateCreated}" /></td>
                            <td><g:link class="btn btn-secondary" action="show" id="${empleadosInstance.id}"><i class="fa-solid fa-eye"></i></g:link></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $('#tblEmpleados').DataTable({
                    order: [[0, "asc"]],
                    language: {
                        "emptyTable": "No hay información",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                        "infoEmpty": "Mostrando 0 to 0 of 0 entradas",
                        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Mostrar _MENU_ entradas",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "Sin resultados encontrados",
                        "paginate": {
                            "first": "Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        },
                    },
                });
            });
        </script>
    </body>
</html>
