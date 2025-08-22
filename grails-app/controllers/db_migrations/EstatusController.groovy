package db_migrations

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "POST"]

    def index() {
        respond Estatus.findAllByActivo(1)
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
    def borrarEstatus(Estatus estatusInstance) {
        if (estatusInstance == null) {
            notFound()
            return
        }
        
        try {
            def estatusToDelete = Estatus.findById(estatusInstance.id)
                estatusToDelete.activo = 0
            
            if (!estatusToDelete.save(flush: true)) {
                flash.error = "¡Error al eliminar registro!"
                flash.icon = "error"
                redirect(action: "index")
                return
            }
            
            def bitacoraElim = new BitacoraEliminacion(
                descripcion: params.motivo,
                estatus: Estatus.get(estatusInstance.id) // Otra opción sería -> estatus: estatusInstance
            )

            if (bitacoraElim.save(flush: true)) {
                flash.message = "Registro eliminado con éxito"
                flash.icon = "success"
            } else {
                flash.error = "¡Error al insertar en bitácora!"
                flash.icon = "error"
            }
        }  catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            flash.icon = "error"
        }

        redirect( action: 'index')
    }
}