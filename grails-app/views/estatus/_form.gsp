<%@ page import="db_migrations.Estatus" %>

<div class="mb-3 fieldcontain ${hasErrors(bean: estatusInstance, field: 'nombre', 'error')} required">
    <label class="form-label" for="nombre">
        <b>Nombre: </b><span class="required-indicator text-danger">*</span>
    </label>
    <g:textField class="form-control" name="nombre" required="" value="${estatusInstance?.nombre}"/>
</div>

<g:if test="${estatusInstance?.activo}">
    <div class="mb-3 fieldcontain ${hasErrors(bean: estatusInstance, field: 'activo', 'error')} required">
        <label class="form-label" for="activo">
            <b>Activo: </b><span class="required-indicator text-danger">*</span>
        </label>
        <g:field class="form-control" name="activo" required="" value="${estatusInstance?.activo}"/>
    </div>
</g:if>