const db = require('../util/database');
 
module.exports = class Gen_Tickets {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(ID_categoria, titulo, descripcion, texto_respuesta, ID_pregunta) {
        this.ID_categoria = ID_categoria;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.texto_respuesta = texto_respuesta;
        this.ID_pregunta = ID_pregunta; 
    }
    //El metodo save no es necesario dentro de la función
    save() {
        return db.execute(

            ('INSERT INTO ticket(ID_categoria, ID_estado, ID_prioridad, titulo, descripción) VALUES(?,?,?,?,?)',
            [this.ID_categoria, 1, 1, this.titulo, this.descripción]),

            ('INSERT INTO respuesta(ID_pregunta, ID_respuesta, texto_respuesta) VALUES(?,?,?,?,?,?)',
            [this.ID_pregunta, this.ID_respuesta, this.texto_respuesta])
            
            ('INSERT INTO genera_ticket(ID_ticket, ID_usuario) VALUES(?,?,?,?,?,?)',
            [this.ID_ticket, this.ID_usuario])

        )

    }
    
    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetch(id) {
        return db.execute(
            'SELECT * FROM info_tickets WHERE ID_categoria=?', [id]);
    }
}
/*
Mandar información a:  [ genera_ticket ->ticket -> respuestas_ticket ->respuesta ]

-genera_ticket:
{ ID_ticket, ID_usuario, fecha_emision }
-ticket:
{ ID_ticket, ID_categoria, ID_estado, ID_prioridad, titulo, descripción }
- respuestas_ticket:
{ ID_ticket, ID_respuesta }
- respuesta:
{ ID_respuesta, ID_pregunta, texto_respuesta }*/
