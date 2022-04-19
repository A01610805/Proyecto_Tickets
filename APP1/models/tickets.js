const { execute } = require('../util/database');
const db = require('../util/database');

module.exports = class Ticket {

    fetch() {
        return db.execute('SELECT * FROM ticketentero');
        //CREATE VIEW usuarios_ticket AS (SELECT resuelve_ticket.ID_ticket, 
        //genera_ticket.ID_usuario AS 'Creador', genera_ticket.fecha_emision, 
        //resuelve_ticket.ID_usuario AS 'Encargado', resuelve_ticket.fecha_inicio, 
        //resuelve_ticket.fecha_fin, resuelve_ticket.comentarios_solucion FROM usuario,
        //resuelve_ticket, genera_ticket WHERE resuelve_ticket.ID_usuario=usuario.ID_usuario 
        //AND genera_ticket.ID_usuario=usuario.ID_usuario)
    }

    static fetchticketsusuario(id) {
        return db.execute('SELECT * FROM ticketstotal WHERE correo_creador=?', [id]);
    }

    static fetchticketsencargado(id) {
        return db.execute('SELECT * FROM ticketstotal WHERE Correo_encargado=?', [id]);
    }

    static fetchticketsnuevos() {
        return db.execute('SELECT * FROM ticketsnuevos');
    }

    static fetchticketsactivos_pag(num) {
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado!=6 AND ID_estado!=5 LIMIT ?, 4', [num]);
    }
    static fetchticketsactivos() {
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado!=6 AND ID_estado!=5 ');
    }

    static fetchticketsactivos_filtros(valor) {
        let arr = valor.split('&');
        console.log(arr[0]);
        console.log(arr[1]);
        console.log(arr[2]);
        console.log(arr[3]);
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado != 6 AND ID_estado != 5 AND Nombre_creador LIKE ? AND Nombre_encargado LIKE ? AND ID_estado LIKE ? AND ID_prioridad LIKE ?', ['%' + arr[0] + '%', '%' + arr[1] + '%', '%' + arr[2] + '%', '%' + arr[3] + '%']);
    }

    static fetchticketsarchivados() {
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado=6 OR ID_estado=5');
    }

    static fetchticketsarchivados_filtros(valor) {
        let arr = valor.split('&');
        console.log(arr[0]);
        console.log(arr[1]);
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado = 6 OR ID_estado = 5 AND Nombre_creador LIKE ? AND Nombre_encargado LIKE ?', ['%' + arr[0] + '%', '%' + arr[1] + '%']);
    }

    static fetchticketsarchivados_pag(num) {
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado=6 OR ID_estado=5 LIMIT ?, 4', [num]);
    }

    static fetchticketsusuario_filtro(valor) {
        //return db.execute('SELECT * FROM ticketstotal WHERE Nombre_creador=?',[id]);
        let arr = valor.split('&');
        console.log(arr[0]);
        console.log(arr[1]);
        return db.execute('SELECT * FROM ticketstotal WHERE correo_creador LIKE ? AND titulo LIKE ?', ['%' + arr[0] + '%', '%' + arr[1] + '%']);
    }

    static fetchticketspropios_pag(nom, num) {
        return db.execute('SELECT * FROM ticketstotal WHERE correo_creador LIKE ? LIMIT ?, 4', ['%' + nom + '%', num]);
    }

    static borrarticketpropio(id) {
        return db.execute('UPDATE ticketstotal SET ticketstotal.ID_estado=5 WHERE ticketstotal.ID_ticket=?', [id])
    }

    static getTotal_activos() {
        return db.execute('SELECT count(*) as total FROM ticketstotal WHERE ID_estado!=6 AND ID_estado!=5')
            .then(([rows, fieldData]) => {
                console.log(rows[0].total);
                return rows[0].total;
            })
            .catch(error => {
                console.log(error);
                return 0;
            });
    }

    static getTotal_archivados() {
        return db.execute('SELECT count(*) as total FROM ticketstotal WHERE ID_estado=6 OR ID_estado=5')
            .then(([rows, fieldData]) => {
                console.log(rows);
                console.log(rows[0].total);
                return rows[0].total;
            })
            .catch(error => {
                console.log(error);
                return 0;
            });
    }

    static getTotal_propios(id) {
        return db.execute('SELECT COUNT(*) as total FROM ticketstotal WHERE correo_creador LIKE ?', ['%' + id + '%'])
            .then(([rows, fieldData]) => {
                console.log(rows);
                console.log(rows[0].total);
                return rows[0].total;
            })
            .catch(error => {
                console.log(error);
                return 0;
            });
    }

    static fetchrespuestas() {
        return db.execute('SELECT * FROM conjuntoderespuestas');
    }

    // ==========================================================================================
    static borrarticket(id) {
        return db.execute('UPDATE ticketstotal SET ticketstotal.ID_estado=5 WHERE ticketstotal.ID_ticket=?', [id])    
    }

    static borrarticketnuevo(id) {
        return db.execute('UPDATE ticketsnuevos SET ticketsnuevos.ID_estado=5 WHERE ticketsnuevos.ID_ticket=?', [id])
    }

}
