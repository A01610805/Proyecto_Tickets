const db = require('../util/database');
 
module.exports = class Pregunta {
   
    constructor(ID_pregunta, ID_categoria, texto_pregunta) {
        this.ID_pregunta = ID_pregunta;
        this.ID_categoria = ID_categoria;
        this.texto_pregunta = texto_pregunta;
     }

    static fetchPreguntas(id) {
        return db.execute(
            'SELECT * FROM pregunta WHERE ID_categoria=?', [id]);
    }
    
    static idpreg(id){
        return db.execute(
            'SELECT ID_pregunta FROM pregunta WHERE ID_categoria=?', [id]);
    }

    static countpreg(id){
        return db.execute(
            'SELECT COUNT(*) FROM pregunta WHERE ID_categoria = ?', [id]);
    }
}
