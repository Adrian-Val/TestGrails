<%@ page import="db_migrations.Actividades" %>

<div class="mb-3 fieldcontain ${hasErrors(bean: actividadesInstance, field: 'nombre', 'error')} required">
    <label class="form-label" for="nombre">
        <b>Nombre</b><span class="required-indicator text-danger">*</span>
    </label>
    <g:textField class="form-control" name="nombre" required="" value="${actividadesInstance?.nombre}"/>
</div>

<div class="mb-3 fieldcontain ${hasErrors(bean: actividadesInstance, field: 'descripcion', 'error')} required">
    <label class="form-label" for="descripcion">
        <b>Descripción</b><span class="required-indicator text-danger">*</span>
    </label>
    <g:textField class="form-control" name="descripcion" required="" value="${actividadesInstance?.descripcion}"/>
</div>

<div class="mb-3 fieldcontain ${hasErrors(bean: actividadesInstance, field: 'descripcion', 'error')} required">
    <label class="form-label" for="descripcion">
        <b>Tipo de actividad</b><span class="required-indicator text-danger">*</span>
    </label>       
    <g:select name="tipoActividad" class="form-control" from="${tipoActividad}" value="${tipoActividad?.id}" optionValue="nombre" optionKey="id"/>
</div>

<g:if test="${actividadesInstance?.activo}">
    <div class="mb-3 fieldcontain ${hasErrors(bean: actividadesInstance, field: 'activo', 'error')} required">  
        <label class="form-label" for="activo">
            <b>Activo</b><span class="required-indicator text-danger">*</span>
        </label>
        <g:field class="form-control" name="activo" value="${actividadesInstance.activo}" required=""/>
    </div>
</g:if>

