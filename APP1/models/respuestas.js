const db = require('../util/database');
 
module.exports = class Respuesta {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(ID_pregunta, ID_ticket, texto_respuesta) {
        this.ID_pregunta = ID_pregunta;
        this.ID_ticket = ID_ticket;
        this.texto_respuesta = texto_respuesta;
     }
    //El metodo save no es necesario dentro de la función
    /*
    save() {
        return db.execute() VALUES ()', 
            []);
    }*/
    save(i, e){
        return db.execute('INSERT INTO respuesta(ID_pregunta, ID_ticket, texto_respuesta) VALUES(?,?,?)',
        [i, e ,this.texto_respuesta])
    }

}