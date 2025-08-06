
<%@ page import="db_migrations.DetalleActividades" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <g:set var="entityName" value="${message(code: 'detalleActividades.label', default: 'DetalleActividades')}" />
        <title>Relación de actividades</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-6 d-flex justify-content-start">
                <h3>Relación de actividades</h3>
            </div>
            <div class="col-6 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-plus"></i> Nuevo</g:link>
            </div>
        </div>
        
        <hr/>

        <div id="list-detalleActividades" class="content scaffold-list" role="main">           
            <table class="table table-striped table-hover" id="tblDetalleActividades">
                <thead class="table-dark">
                    <tr>
                        <th class="text-center" width="10px">#</th>
                        <th>Responsable</th>
                        <th>Actividad</th>
                        <th>Estatus</th>
                        <th>Fecha de creación</th>
                        <th>Activo</th>
                        <th>Ver</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${detalleActividadesInstanceList}" status="i" var="detalleActividadesInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td class="text-center">${i + 1}</td>
                            <td>${fieldValue(bean: detalleActividadesInstance, field: "empleados")}</td>
                            <td>${fieldValue(bean: detalleActividadesInstance, field: "actividades")}</td>
                            <td>${fieldValue(bean: detalleActividadesInstance, field: "estatus")}</td>
                            <td><g:formatDate format="dd-MM-yyyy" date="${detalleActividadesInstance.dateCreated}" /></td>
                            <td>
                                <g:if test="${detalleActividadesInstance?.activo}">
                                    <i class="btn btn-success fa-solid fa-circle-check"></i>
                                </g:if>
                                <g:if test="${detalleActividadesInstance?.activo != 1}">
                                    <i class="btn btn-danger fa-solid fa-ban"></i>
                                </g:if>
                            </td>
                            <td><g:link class="btn btn-secondary" action="show" id="${detalleActividadesInstance.id}"><i class="fa-solid fa-eye"></i></g:link></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $('#tblDetalleActividades').DataTable({
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
