<%@ page import="db_migrations.DetalleActividades" %>

<div class="mb-3 fieldcontain ${hasErrors(bean: detalleActividadesInstance, field: 'actividades', 'error')} required">
    <label for="actividades"><b>Actividad</b>
        <span class="required-indicator text-danger">*</span>
    </label>
    <g:select class="form-control" id="actividades" name="actividades.id" from="${db_migrations.Actividades.list()}" optionKey="id" required="" value="${detalleActividadesInstance?.actividades?.id}" optionValue="nombre" class="many-to-one"/>
</div>

<div class="mb-3 fieldcontain ${hasErrors(bean: detalleActividadesInstance, field: 'empleados', 'error')} required">
    <label for="empleados">
        <b>Responsable</b>
        <span class="required-indicator text-danger">*</span>
    </label>
    <g:select class="form-control" id="empleados" name="empleados.id" from="${db_migrations.Empleados.list()}" optionKey="id" required="" value="${detalleActividadesInstance?.empleados?.id}" optionValue="nombre" class="many-to-one"/>
</div>

<div class="mb-3 fieldcontain ${hasErrors(bean: detalleActividadesInstance, field: 'estatus', 'error')} required">
    <label for="estatus">
        <b>Estatus</b>
        <span class="required-indicator text-danger">*</span>
    </label>
    <g:select class="form-control" id="estatus" name="estatus.id" from="${db_migrations.Estatus.list()}" optionKey="id" required="" value="${detalleActividadesInstance?.estatus?.id}" optionValue="nombre" class="many-to-one"/>
</div>

<g:if test="${detalleActividadesInstance?.activo}">
    <div class="mb-3 fieldcontain ${hasErrors(bean: detalleActividadesInstance, field: 'activo', 'error')} required">
        <label for="activo">
            <b>Activo</b>
            <span class="required-indicator text-danger">*</span>
        </label>
        <g:field class="form-control" name="activo" type="number" value="${detalleActividadesInstance.activo}" required=""/>
    </div>
</g:if>