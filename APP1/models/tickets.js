const db = require('../util/database');

module.exports = class Ticket {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(ID_Ticket, description, preg1, preg2, preg3) {
        this.id = ID_Ticket;
        this.descripcion = description;
        this.pregunta_uno = preg1;
        this.pregunta_dos = preg2;
        this.pregunta_tres = preg3;
    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {
        return db.execute('INSERT INTO ticket (nombre, descripcion, imagen, duenio_id) VALUES (?, ?, ?, ?, ?)', 
            [this.id, this.descripcion, this.pregunta_uno, this.pregunta_dos, this.pregunta_tres]);
    }

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll() {
        return db.execute(
            'SELECT c.nombre, descripcion, imagen, duenio_id, c.created_at, u.nombre as duenio FROM capybaras c, usuarios u WHERE c.duenio_id = u.username');
    }
}