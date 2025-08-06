<%@ page import="db_migrations.Actividades" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <g:set var="entityName" value="${message(code: 'actividades.label', default: 'Actividades')}" />
        <title>Editar actividad</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-6 d-flex justify-content-start">
                <h3>Editar actividad</h3>
            </div>
            <div class="col-6 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-warning list" action="index"><i class="fa-solid fa-list"></i> Listado</g:link>
                &nbsp;&nbsp;&nbsp;
                <g:link class="btn btn-success create" action="create"><i class="fa-solid fa-plus"></i> Nuevo</g:link>
            </div>
        </div>
                
        <hr/>
        
        <div id="edit-actividades" class="content scaffold-edit" role="main">
            <!--<g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <g:hasErrors bean="${actividadesInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${actividadesInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>-->
    
            <g:form url="[resource:actividadesInstance, action:'update']" method="PUT" >
                <g:hiddenField name="version" value="${actividadesInstance?.version}" />
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
