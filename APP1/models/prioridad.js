const db = require('../util/database');

module.exports = class Prioridad {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(ID_prioridad, ID_ticket) {
        this.ID_prioridad = ID_prioridad;
        this.ID_ticket = ID_ticket;
    }


    /*update() {
        return db.execute('UPDATE ticketstotal set ID_prioridad = ? WHERE  ID_ticket = ?', [this.ID_prioridad, this.ID_ticket]);
    }*/
    updatenuevo() {
        return db.execute('UPDATE ticketsnuevos set ID_prioridad = ? WHERE  ID_ticket = ?', [this.ID_prioridad, this.ID_ticket]);
    }

    /*static update(prioridad,id) {
        return db.execute('UPDATE ticket set ID_prioridad = '+prioridad+' WHERE ID_ticket =' +id);
    }*/

    static update() {
        //return db.execute('UPDATE ticket set ID_prioridad = '+prioridad+' WHERE ID_ticket =' +id);
        return db.execute('UPDATE ticket set ID_prioridad = ? WHERE  ID_ticket = ?', [this.ID_prioridad, this.ID_ticket]);
    }
}