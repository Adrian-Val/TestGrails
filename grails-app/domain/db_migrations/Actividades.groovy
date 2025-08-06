package db_migrations

class Actividades {
    TipoActividad tipoActividad
    String nombre
    String descripcion
    int activo
    Date dateCreated
    
    static constraints = {}
        
    static mapping = {
        id generator : 'sequence', column : 'id_actividad', params:[sequence:'id_actividad_seq']
    }
}
