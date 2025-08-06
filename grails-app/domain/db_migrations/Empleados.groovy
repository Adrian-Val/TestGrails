package db_migrations

class Empleados {
    String nombre
    String ap_paterno
    String ap_materno
    String cargo
    int activo
    Date dateCreated
    
    static constraints = {}
    
    static mapping = {
        id generator : 'sequence', column : 'id_empleado', params:[sequence:'id_empleado_seq']
    }
}
