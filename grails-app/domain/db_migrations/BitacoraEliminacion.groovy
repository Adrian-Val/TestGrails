package db_migrations

class BitacoraEliminacion {
    Estatus estatus
    String motivo
    Date dateCreated
        
    static constraints = {}
    
    static mapping = {
        id generator : 'sequence', column : 'id_bitacora_eliminacion', params:[sequence:'id_bitacora_eliminacion_seq']
    }
}
