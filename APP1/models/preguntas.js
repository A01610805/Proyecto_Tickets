const db = require('../util/database');
 
module.exports = class Pregunta {
    constructor(ID_categoria, texto_pregunta) {
        this.nombre_categoria = nombre_categoria;
        this.tiempo_estimado = tiempo_estimado;

    }
   
    static fetchPreguntas(id) {
        return db.execute(
            'SELECT * FROM pregunta WHERE ID_categoria=?', [id]);
    }
    
    idpreg(id){
        return db.execute(
            'SELECT ID_pregunta FROM pregunta WHERE ID_categoria=?', [id]);
    }

    countpreg(id){
        return db.execute(
            'SELECT COUNT(*) FROM pregunta WHERE ID_categoria = ?', [id]);
    }
    delete(id){
        return db.execute(
            'DELETE FROM pregunta WHERE  ID_categoria=?', [id]);
    }
}
