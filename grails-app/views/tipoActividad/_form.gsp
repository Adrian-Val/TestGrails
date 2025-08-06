<%@ page import="db_migrations.TipoActividad" %>

<div class="mb-3 fieldcontain ${hasErrors(bean: tipoActividadInstance, field: 'nombre', 'error')} required">
    <label class="form-label" for="nombre">
        <b>Nombre</b><span class="required-indicator text-danger">*</span>
    </label>
    <g:textField class="form-control" name="nombre" required="" value="${tipoActividadInstance?.nombre}"/>
</div>

<g:if test="${tipoActividadInstance?.activo}">
    <div class="mb-3 fieldcontain ${hasErrors(bean: tipoActividadInstance, field: 'activo', 'error')} required">
        <label class="form-label" for="activo">
            <b>Activo</b><span class="required-indicator text-danger">*</span>
        </label>
        <g:field class="form-control" name="activo" value="${tipoActividadInstance.activo}" required=""/>
    </div>
</g:if>