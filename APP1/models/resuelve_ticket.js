const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class RESUELVE {

    static encargado_inicial_234(idusuario,idticket) {
        return db.execute('UPDATE resuelve_ticket set ID_usuario = ?, fecha_inicio = CURRENT_TIMESTAMP  WHERE ID_ticket = ?', [idusuario,idticket]);
    }

    static encargado_inicial_56(idusuario,idticket) {
        return db.execute('UPDATE resuelve_ticket set ID_usuario = ?, fecha_inicio = CURRENT_TIMESTAMP, fecha_fin = CURRENT_TIMESTAMP, comentarios_solucion = "Ticket resuelto o cancelado instantaneamente"  WHERE ID_ticket = ?', [idusuario,idticket]);
    }

    static estado_56(idusuario,idticket) {
        return db.execute('UPDATE resuelve_ticket set fecha_fin = CURRENT_TIMESTAMP WHERE ID_ticket = ?', [idusuario,idticket]);
    }

    /*static inicio_solucion(idticket) {
        return db.execute('UPDATE resuelve_ticket set fecha_inicio = current_timestamp() WHERE ID_ticket = ?', [idticket]);
    }*/

}