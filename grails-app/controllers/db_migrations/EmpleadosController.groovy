package db_migrations

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmpleadosController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        respond Empleados.list()
    }
    
    def show(Empleados empleadosInstance) {
        respond empleadosInstance
    }

    def create() {
        respond new Empleados(params)
    }
    
    @Transactional
    def save(Empleados empleadosInstance) {
        if (empleadosInstance == null) {
            notFound()
            return
        }

        try {
            empleadosInstance.activo = 1
            empleadosInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'empleados.label', default: 'Empleado'), 
                            empleadosInstance.nombre + " " + empleadosInstance.ap_paterno + " " + empleadosInstance.ap_materno])
                    redirect empleadosInstance
                }
                '*' { respond empleadosInstance, [status: CREATED] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }
    
    def edit(Empleados empleadosInstance) {
        respond empleadosInstance
    }
    
    @Transactional
    def update(Empleados empleadosInstance) {
        if (empleadosInstance == null) {
            notFound()
            return
        }

        try {
            empleadosInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'empleados.label', default: 'Empleado'),
                            empleadosInstance.nombre + " " + empleadosInstance.ap_paterno + " " + empleadosInstance.ap_materno])
                    redirect empleadosInstance
                }
                '*'{ respond empleadosInstance, [status: OK] }
            }
        } catch (Exception e) {
            flash.error  = "¡Ocurrió un error inesperado!"
            redirect( action: 'create')
        }
    }
    
    @Transactional
    def delete(Empleados empleadosInstance) {
        if (empleadosInstance == null) {
            notFound()
            return
        }

        try {
            empleadosInstance.delete flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'empleados.label', default: 'Empleados'), empleadosInstance.id])
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
