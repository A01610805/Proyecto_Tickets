const { execute } = require('../util/database');
const db = require('../util/database');

module.exports = class Ticket {
    constructor(comentario_solucion, ID_ticket) {
        this.comentarios_solucion = comentario_solucion;
        this.ID_ticket = ID_ticket;
    }

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
    static fetchticketSeleccionado(id) {
        return db.execute('SELECT * FROM ticketstotal WHERE ID_ticket = ?', [id]);
    }
    static fetchresTiseleccionado(id) {
        return db.execute('SELECT texto_respuesta FROM respuesta WHERE  ID_ticket = ?', [id]);
    }

    static fetchticketsnuevos() {
        return db.execute('SELECT * FROM ticketsnuevos');
    }

    static fetchticketsactivos_pag(num) {                                                                                           
        return db.execute("SELECT * FROM `ticketstotal` WHERE `ID_estado`!=6 AND `ID_estado`!=5 GROUP BY `ID_ticket` ORDER BY `ID_ticket` DESC LIMIT "+num+",5");
        //return db.execute("SELECT * FROM ticketstotal WHERE ID_estado!=6 AND ID_estado!=5 GROUP BY ID_ticket DESC LIMIT ?, 5", [num]);
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
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado != 6 AND ID_estado != 5 AND ID_ticket LIKE ? AND Nombre_encargado LIKE ? AND ID_estado LIKE ? AND ID_prioridad LIKE ?', ['%' + arr[0] + '%', '%' + arr[1] + '%', '%' + arr[2] + '%', '%' + arr[3] + '%']);
    }

    static fetchticketsarchivados() {
        return db.execute('SELECT * FROM ticketstotal WHERE ID_estado=6 OR ID_estado=5');
    }

    static fetchticketsarchivados_filtros(valor) {
        let arr = valor.split('&');
        console.log(arr[0]);
        console.log(arr[1]);
        console.log(arr[2]);
        console.log(arr[3]);
        return db.execute('SELECT * FROM ticketstotal WHERE (ID_estado = 6 OR ID_estado = 5) AND ID_ticket LIKE ? AND Nombre_creador LIKE ? AND Nombre_encargado LIKE ? AND ID_prioridad LIKE ?', ['%' + arr[0] + '%', '%' + arr[1] + '%', '%' + arr[2] + '%', '%' + arr[3] + '%']);
    }

    static fetchticketsarchivados_pag(num) {
        //return db.execute('SELECT * FROM ticketstotal WHERE ID_estado=6 OR ID_estado=5 GROUP BY ID_ticket ORDER BY ID_ticket DESC LIMIT ?, 5', [num]);
        return db.execute("SELECT * FROM `ticketstotal` WHERE `ID_estado`=6 OR `ID_estado`=5 GROUP BY `ID_ticket` ORDER BY `ID_ticket` DESC LIMIT "+num+",5");
    }

    static fetchticketsusuario_filtro(valor) {
        //return db.execute('SELECT * FROM ticketstotal WHERE Nombre_creador=?',[id]);
        let arr = valor.split('&');
        console.log(arr[0]);
        console.log(arr[1]);
        return db.execute('SELECT * FROM ticketstotal WHERE correo_creador LIKE ? AND ID_ticket LIKE ?', ['%' + arr[0] + '%', '%' + arr[1] + '%']);
    }

    static fetchticketspropios_pag(id, num) {
        console.log(id);
        console.log(num);
        //return db.execute('SELECT * FROM ticketstotal WHERE correo_creador LIKE ? GROUP BY ID_ticket ORDER BY ID_ticket DESC LIMIT ?, 5', ['%' + nom + '%', num]);
        return db.execute("SELECT * FROM `ticketstotal` WHERE Creador ="+id+" GROUP BY `ID_ticket` ORDER BY `ID_ticket` DESC LIMIT "+num+",5");
    }

    static cancelar_ticket_1(idticket) {
        return db.execute('UPDATE ticket SET ID_estado = 5 WHERE ID_ticket=?', [idticket])
    }

    static cancelar_ticket_2(idticket) {
        return db.execute('UPDATE resuelve_ticket SET fecha_fin = CURRENT_TIMESTAMP WHERE ID_ticket=?', [idticket])
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

    static fetchrespuestas_busqueda(id) {
        return db.execute('SELECT * FROM conjuntoderespuestas WHERE ID_ticket = ?', [id]);
    }

    // ========================================================================================== //
    /*static borrarticket(id) {
        return db.execute('UPDATE ticketstotal SET ticketstotal.ID_estado=5 WHERE ticketstotal.ID_ticket=?', [id])
    }*/

    static borrarticketnuevo1(idticket) {
        return db.execute('UPDATE ticket SET ID_estado = 5 WHERE ID_ticket=?', [idticket])
    }

    static borrarticketnuevo2(idusuario,idticket) {
        return db.execute('UPDATE resuelve_ticket SET ID_usuario = ?, fecha_inicio = CURRENT_TIMESTAMP, fecha_fin = CURRENT_TIMESTAMP, comentarios_solucion = "Ticket cancelado" WHERE ID_ticket=?', [idusuario,idticket])
    }

    static modificarcomentario(id1, id2) {
        return db.execute('UPDATE ticketstotal set comentarios_solucion = ? WHERE  ID_ticket = ?', [id1, id2]);
    }

    //================================================================================================//
    static fetchticket_estado(id) {
        return db.execute('SELECT * FROM ticket WHERE ID_ticket = ?', [id]);
    }

    static update_estado(nuevo_estado, idticket) {
        return db.execute('UPDATE ticket set ID_estado = ? WHERE ID_ticket = ?', [nuevo_estado, idticket]);
    }

    static estado_actual(idticket) {
        return db.execute('SELECT ID_estado FROM ticket WHERE ID_ticket = ?', [idticket]);
    }
    static asignarusuario(idu, idt) {
            return db.execute('UPDATE resuelve_ticket, ticket SET resuelve_ticket.ID_usuario=?, resuelve_ticket.fecha_inicio=CURRENT_DATE(), ticket.ID_estado=2 WHERE resuelve_ticket.ID_ticket=ticket.ID_ticket AND resuelve_ticket.ID_ticket=?', [idu, idt]);
        }
        //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//
    static obtenercomentarios() {
        return db.execute('SELECT ID_ticket, ID_usuario, nombre, apellido_paterno, apellido_materno, ID_comentario, texto_comentario, DATE_FORMAT(fecha_comentario, "%m %d %Y") FROM comentariosproceso ');
    }

    static agregarcomentarios(id1, id2, id3) {
        return db.execute('CALL AgregarComentario(?,?,?);', [id1, id2, id3]);
    }

    static fetchticket_prioridad(id) {
        return db.execute('SELECT * FROM ticket WHERE ID_ticket = ?', [id]);
    }

    static obtenercomentarios_id(id) {
        return db.execute('SELECT * FROM comentariosproceso WHERE ID_ticket = ?', [id]);
    }

}