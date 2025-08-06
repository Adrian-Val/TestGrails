package db_migrations

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActividadesController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def index(Integer max) {
        respond Actividades.list()
    }
    
    def show(Actividades actividadesInstance) {
        respond actividadesInstance
    }
    
    def create(){
        def tipoActividad = TipoActividad.list()
        respond new Actividades(params), model:[tipoActividad:tipoActividad]
    }
    
    @Transactional
    def save(Actividades actividadesInstance) {
        if (actividadesInstance == null) {
            notFound()
            return
        }

        try {
            actividadesInstance.save flush:true
            actividadesInstance.activo = 1

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'actividades.label', default: 'Actividad'), actividadesInstance.nombre])
                    redirect actividadesInstance
                }
                '*' { respond actividadesInstance, [status: CREATED] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }
    
    def edit(Actividades actividadesInstance) {
        def tipoActividad = TipoActividad.list()
        respond actividadesInstance, model:[tipoActividad:tipoActividad]
    }
    
    @Transactional
    def update(Actividades actividadesInstance) {
        if (actividadesInstance == null) {
            notFound()
            return
        }

        try {
            actividadesInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'actividades.label', default: 'Actividad'), actividadesInstance.nombre])
                    redirect actividadesInstance
                }
                '*'{ respond actividadesInstance, [status: OK] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }
    
    @Transactional
    def delete(Actividades actividadesInstance) {
        if (actividadesInstance == null) {
            notFound()
            return
        }

        try {
            actividadesInstance.delete flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'actividades.label', default: 'Actividades'), actividadesInstance.id])
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
