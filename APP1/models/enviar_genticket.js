const db = require('../util/database');
 
module.exports = class Info_GenTickets {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(ID_categoria, nombre_categoria, tiempo_estimado, ID_pregunta, texto_pregunta) {
        this.ID_categoria = ID_categoria;
        this.nombre_categoria = nombre_categoria;
        this.tiempo_estimado = tiempo_estimado;
        this.descripcion = descripcion;
        this.ID_pregunta = ID_pregunta;
        this.texto_pregunta = texto_pregunta;
    }
    //El metodo save no es necesario dentro de la función
    save() {
        return db.execute(

            ('INSERT INTO respuesta(ID_respuesta, ID_pregunta, texto_respuesta) VALUES(?,?,?,?,?,?)',
            [this.ID_rol, this.nombre, this.apellido_paterno, this.apellido_materno, this.correo, password_cifrado]),

            ('INSERT INTO ticket(ID_ticket, ID_categoria, ID_estado, ID_prioridad, titulo, descripción) VALUES(?,?,?,?,?,?)',
            [this.ID_rol, this.nombre, this.apellido_paterno, this.apellido_materno, this.correo, password_cifrado]),
            
            ('INSERT INTO usuario(ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) VALUES(?,?,?,?,?,?)',
            [this.ID_rol, this.nombre, this.apellido_paterno, this.apellido_materno, this.correo, password_cifrado])
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
