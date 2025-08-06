
<%@ page import="db_migrations.Estatus" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <g:set var="entityName" value="${message(code: 'estatus.label', default: 'Estatus')}" />
        <title>Estatus</title>
    </head>
    <body> 
        <div class="row">
            <div class="col-md-6 d-flex justify-content-start">
                <h3>Estatus</h3>
            </div>
            <div class="col-6 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-plus"></i> Nuevo</g:link>
            </div>
        </div>
        
        <hr/>
        
        <div id="list-estatus" class="content scaffold-list" role="main">           
            <table id="tblEstatus" class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th class="text-center" width="10px">#</th>
                        <th>Nombre</th>
                        <th>Fecha de creación</th>
                        <th class="text-center">Activo</th>
                        <th class="text-center">Ver</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${estatusInstanceList}" status="i" var="estatusInstance" status="i">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td class="text-center">${i + 1}</td>
                            <td>${fieldValue(bean: estatusInstance, field: "nombre")}</td>
                            <td>
                                <g:formatDate format="dd-MM-yyyy" date="${estatusInstance.dateCreated}" />
                            </td>
                            <td class="text-center">
                                <g:if test="${estatusInstance?.activo}">
                                    <i class="btn btn-success fa-solid fa-circle-check"></i>
                                </g:if>
                                <g:if test="${estatusInstance?.activo != 1}">
                                    <i class="btn btn-danger fa-solid fa-ban"></i>
                                </g:if>
                            </td>
                            <td class="text-center"><g:link class="btn btn-secondary" action="show" id="${estatusInstance.id}"><i class="fa-solid fa-eye"></i></g:link></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $('#tblEstatus').DataTable({
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
