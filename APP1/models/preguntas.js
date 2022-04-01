const db = require('../util/database');
 
module.exports = class Pregunta {
   
    static fetchPreguntas(id) {
        return db.execute(
            'SELECT * FROM pregunta WHERE ID_categoria=?', [id]);
    }
    
    ID_pregunta(id){
        return db.execute(
            'SELECT ID_pregunta FROM pregunta WHERE ID_categoria=?', [id]);
    }

}
