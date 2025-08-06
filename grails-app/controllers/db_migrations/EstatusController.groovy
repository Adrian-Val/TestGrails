package db_migrations

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        respond Estatus.list()
    }

    def show(Estatus estatusInstance) {
        respond estatusInstance
    }

    def create() {
        respond new Estatus(params)
    }

    @Transactional
    def save(Estatus estatusInstance) {
        if (estatusInstance == null) {
            notFound()
            return
        }

        try {
            estatusInstance.save flush:true
            estatusInstance.activo = 1

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'estatus.label', default: 'Estatus'), estatusInstance.nombre])
                    redirect estatusInstance
                }
                '*' { respond estatusInstance, [status: CREATED] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }

    def edit(Estatus estatusInstance) {
        respond estatusInstance
    }

    @Transactional
    def update(Estatus estatusInstance) {
        if (estatusInstance == null) {
            notFound()
            return
        }
        
        try {
            estatusInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'Estatus.label', default: 'Estatus'), estatusInstance.nombre])
                    redirect estatusInstance
                }
                '*'{ respond estatusInstance, [status: OK] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }

    @Transactional
    def delete(Estatus estatusInstance) {

        if (estatusInstance == null) {
            notFound()
            return
        }

        try {
            estatusInstance.delete flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'Estatus.label', default: 'Estatus'), estatusInstance.id])
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
