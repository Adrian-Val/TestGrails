package db_migrations



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DetalleActividadesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        respond DetalleActividades.list()
    }

    def show(DetalleActividades detalleActividadesInstance) {
        respond detalleActividadesInstance
    }

    def create() {
        respond new DetalleActividades(params)
    }

    @Transactional
    def save(DetalleActividades detalleActividadesInstance) {
        if (detalleActividadesInstance == null) {
            notFound()
            return
        }

        try {
            detalleActividadesInstance.activo = 1
            detalleActividadesInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'detalleActividades.label', default: 'Relación de actividades'), ""])
                    redirect detalleActividadesInstance
                }
                '*' { respond detalleActividadesInstance, [status: CREATED] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }

    def edit(DetalleActividades detalleActividadesInstance) {
        respond detalleActividadesInstance
    }

    @Transactional
    def update(DetalleActividades detalleActividadesInstance) {
        if (detalleActividadesInstance == null) {
            notFound()
            return
        }

        try {
            detalleActividadesInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'DetalleActividades.label', default: 'Relación de actividades'), ""])
                    redirect detalleActividadesInstance
                }
                '*'{ respond detalleActividadesInstance, [status: OK] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }

    @Transactional
    def delete(DetalleActividades detalleActividadesInstance) {

        if (detalleActividadesInstance == null) {
            notFound()
            return
        }

        try {
            detalleActividadesInstance.delete flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'DetalleActividades.label', default: 'DetalleActividades'), detalleActividadesInstance.id])
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
