const { execute } = require('../util/database');
const db = require('../util/database');
 
module.exports = class Ticket {
    fetch(){
        return db.execute('SELECT * FROM Tickets, genera_ticket WHERE Tickets.ID_usuario=genera_ticket.ID_usuario');
    }
    fetchticketssusuario(id){
        return db.execute('SELECT * FROM Tickets, genera_ticket WHERE Tickets.ID_usuario=genera_ticket.ID_usuario AND ID_usuario=?',[id]);
    }
    fetchticketsarchivados(){
        return db.execute('SELECT * FROM Tickets, genera_ticket WHERE Tickets.ID_usuario=genera_ticket.ID_usuario AND ID_estado=6');
    }
    fetchticketsactivos(){
        return db.execute('SELECT * FROM Tickets, genera_ticket WHERE Tickets.ID_usuario=genera_ticket.ID_usuario AND ID_estado!=6');
    }
}