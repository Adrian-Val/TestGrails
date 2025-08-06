package db_migrations

class Estatus {
    String nombre
    int activo
    Date dateCreated
    
    static constraints = {}
    
    static mapping = {
        id generator : 'sequence', column : 'id_estatus', params:[sequence:'id_estatus_seq']
    }
}

