package db_migrations

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoActividadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        respond TipoActividad.list()
    }

    def show(TipoActividad tipoActividadInstance) {
        respond tipoActividadInstance
    }

    def create() {
        respond new TipoActividad(params)
    }

    @Transactional
    def save(TipoActividad tipoActividadInstance) {
        if (tipoActividadInstance == null) {
            notFound()
            return
        }

        try{
            tipoActividadInstance.save flush:true
            tipoActividadInstance.activo = 1

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'tipoActividad.label', default: 'Tipo de actividad'), tipoActividadInstance.nombre])
                    redirect tipoActividadInstance
                }
                '*' { respond tipoActividadInstance, [status: CREATED] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }

    def edit(TipoActividad tipoActividadInstance) {
        respond tipoActividadInstance
    }

    @Transactional
    def update(TipoActividad tipoActividadInstance) {
        if (tipoActividadInstance == null) {
            notFound()
            return
        }

        try {
            tipoActividadInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoActividad.label', default: 'Tipo de actividad'), tipoActividadInstance.nombre])
                    redirect tipoActividadInstance
                }
                '*'{ respond tipoActividadInstance, [status: OK] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }

    @Transactional
    def delete(TipoActividad tipoActividadInstance) {
        if (tipoActividadInstance == null) {
            notFound()
            return
        }

        try {
            tipoActividadInstance.delete flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoActividad.label', default: 'TipoActividad'), tipoActividadInstance.id])
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }
}
