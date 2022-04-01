const { execute } = require('../util/database');
const db = require('../util/database');
 
module.exports = class Ticket {
    
    fetch(){
        return db.execute('SELECT * FROM ticketentero');
        //CREATE VIEW usuarios_ticket AS (SELECT resuelve_ticket.ID_ticket, genera_ticket.ID_usuario AS 'Creador', genera_ticket.fecha_emision, resuelve_ticket.ID_usuario AS 'Encargado', resuelve_ticket.fecha_inicio, resuelve_ticket.fecha_fin, resuelve_ticket.comentarios_solucion FROM usuario, resuelve_ticket, genera_ticket WHERE resuelve_ticket.ID_usuario=usuario.ID_usuario AND genera_ticket.ID_usuario=usuario.ID_usuario)
    }

    static fetchticketsusuario(id){
        return db.execute('SELECT * FROM ticketstotal WHERE Nombre_creador=?',[id]);
    }

    static fetchticketsarchivados(){
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado=6 OR ID_estado=5');
    }

    static fetchticketsactivos(){
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado!=6 AND ID_estado!=5');
    }
    static borrarticketpropio(id){
        return db.execute('UPDATE ticketstotal SET ticketstotal.ID_estado=5 WHERE ticketstotal.ID_ticket=?',[id])
    }

}