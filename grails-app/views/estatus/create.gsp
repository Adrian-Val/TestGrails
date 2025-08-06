<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="app">
        <g:set var="entityName" value="${message(code: 'estatus.label', default: 'Estatus')}" />
        <title>Crear estatus</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-6 d-flex justify-content-start">
                <h3>Crear estatus</h3>
            </div>
            <div class="col-6 d-flex justify-content-end" role="navigation">
                <g:link class="btn btn-warning list" action="index"><i class="fa-solid fa-list"></i> Listado</g:link>
            </div>
        </div>

        <hr/>
        
        <div id="create-estatus" class="content scaffold-create" role="main">
            <g:form url="[resource:estatusInstance, action:'save']" >
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">                    
                    <button type="submit" class="btn btn-success save" name="create"><i class="fa-solid fa-pen-to-square"></i> Guardar</button>
                </fieldset>
            </g:form>    
        </div>
        
        <g:if test="${flash.error}">
            <script type="text/javascript">
                Swal.fire({
                  text: '${flash.error}',
                  icon: 'error',
                  confirmButtonText: 'OK'
                });
            </script>
        </g:if>
    </body>
</html>
