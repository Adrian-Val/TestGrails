<%@ page import="db_migrations.Estatus" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <g:set var="entityName" value="${message(code: 'estatus.label', default: 'Estatus')}" />
        <title>Editar estatus</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-6 d-flex justify-content-start">
                <h3>Editar estatus</h3>
            </div>
            <div class="col-6 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-warning list" action="index"><i class="fa-solid fa-list"></i> Listado</g:link>
                &nbsp;&nbsp;&nbsp;
                <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-plus"></i> Nuevo</g:link>
            </div>
        </div>
                
        <hr/>
                
        <div id="edit-estatus" class="content scaffold-edit" role="main">           
            <g:form url="[resource:estatusInstance, action:'update']" method="PUT" >
                <g:hiddenField name="version" value="${estatusInstance?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <button type="submit" class="btn btn-primary save" action="update"><i class="fa-solid fa-pen-to-square"></i> Actualizar</button>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
