package db_migrations

class TipoActividad {
    String nombre
    int activo
    Date dateCreated

    static constraints = {}
    
    static mapping = {
        id generator : 'sequence', column : 'id_tipo_actividad', params:[sequence:'id_tipo_actividad_seq']
    }
}
