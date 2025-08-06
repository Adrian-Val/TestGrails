package db_migrations

class DetalleActividades {
    Actividades actividades
    Empleados empleados
    Estatus estatus
    int activo
    Date dateCreated
    
    static constraints = {}
    
    static mapping = {
        id generator : 'sequence', column : 'id_detalle_actividades', params:[sequence:'id_detalle_actividades_seq']
    }
}
