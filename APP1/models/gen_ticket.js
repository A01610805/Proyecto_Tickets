const db = require('../util/database');
 
module.exports = class Gen_Tickets {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(ID_categoria, titulo, descripcion) {
        this.ID_categoria = ID_categoria;
        this.titulo = titulo;
        this.descripcion = descripcion;
    }
    //El metodo save no es necesario dentro de la función
    save() {
        return db.execute(

            ('INSERT INTO ticket(ID_categoria, ID_estado, ID_prioridad, titulo, descripcion) VALUES(?,?,?,?,?)',
            [this.ID_categoria, 1, 1, this.titulo, this.descripcion])
            
            // ('INSERT INTO genera_ticket(ID_ticket, ID_usuario) VALUES(?,?,?,?,?,?)',
            // [this.ID_ticket, this.ID_usuario])

        )

    }

    // obtenerid(){
    //     return db.execute('SELECT ID_ticket FROM ticket ORDER BY ID_ticket DESC LIMIT 1')
    // }

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    /*static fetch(id) {
        return db.execute(
            'SELECT * FROM info_tickets WHERE ID_categoria=?', [id]);
    }*/
}