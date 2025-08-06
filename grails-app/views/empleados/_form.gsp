<%@ page import="db_migrations.Empleados" %>

<div class="mb-3 fieldcontain ${hasErrors(bean: empleadosInstance, field: 'nombre', 'error')} required">
    <label class="form-label" for="nombre">
        <b>Nombre</b><span class="required-indicator text-danger">*</span>
    </label>
    <g:textField class="form-control" name="nombre" required="" value="${empleadosInstance?.nombre}"/>
</div>

<div class="mb-3 fieldcontain ${hasErrors(bean: empleadosInstance, field: 'ap_paterno', 'error')} required">
    <label class="form-label" for="ap_paterno">
        <b>Apellido paterno</b><span class="required-indicator text-danger">*</span>
    </label>
    <g:textField class="form-control" name="ap_paterno" required="" value="${empleadosInstance?.ap_paterno}"/>
</div>

<div class="mb-3 fieldcontain ${hasErrors(bean: empleadosInstance, field: 'ap_materno', 'error')} required">
    <label class="form-label" for="ap_materno">
        <b>Apellido materno</b><span class="required-indicator text-danger">*</span>
    </label>
    <g:textField class="form-control" name="ap_materno" required="" value="${empleadosInstance?.ap_materno}"/>
</div>

<div class="mb-3 fieldcontain ${hasErrors(bean: empleadosInstance, field: 'cargo', 'error')} required">
    <label class="form-label" for="cargo">
        <b>Cargo</b><span class="required-indicator text-danger">*</span>
    </label>
    <g:textField class="form-control" name="cargo" required="" value="${empleadosInstance?.cargo}"/>
</div>

<g:if test="${empleadosInstance?.activo}">
    <div class="mb-3 fieldcontain ${hasErrors(bean: empleadosInstance, field: 'activo', 'error')} required">
        <label class="form-label" for="activo">
            <b>Activo: </b><span class="required-indicator text-danger">*</span>
        </label>
        <g:field class="form-control" name="activo" required="" value="${empleadosInstance?.activo}"/>
    </div>
</g:if>
