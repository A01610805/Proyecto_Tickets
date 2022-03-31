const db = require('../util/database');
 
module.exports = class Pregunta {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    // constructor(ID_categoria, nombre_categoria, tiempo_estimado, ID_pregunta, texto_pregunta) {
    //     this.ID_categoria = ID_categoria;
    //     this.nombre_categoria = nombre_categoria;
    //     this.tiempo_estimado = tiempo_estimado;
    //     this.descripcion = descripcion;
    //     this.ID_pregunta = ID_pregunta;
    //     this.texto_pregunta = texto_pregunta;
    // }
    //El metodo save no es necesario dentro de la función
    /*
    save() {
        return db.execute() VALUES ()', 
            []);
    }*/

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchPreguntas(id) {
        return db.execute(
            'SELECT * FROM pregunta WHERE ID_categoria=?', [id]);
    }
}
