const db = require('../util/database');
 
module.exports = class Pregunta {
    constructor(texto_pregunta, ID_categoria, ID_pregunta) {
        this.texto_pregunta = texto_pregunta;
        this.ID_categoria = ID_categoria;
        this.ID_pregunta = ID_pregunta;

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
    update(){
        return db.execute(
            'UPDATE pregunta SET texto_pregunta = ? WHERE ID_categoria = ? AND ID_pregunta = ?', [this.texto_pregunta, this.ID_categoria, this.ID_pregunta]);
    }
    // delete(id){
    //     return db.execute(
    //         'DELETE FROM pregunta WHERE  ID_categoria=?', [id]);
    // }
    // addpreg(){
    //     return db.execute(
    //         'INSERT INTO pregunta(texto_pregunta, ID_categoria) VALUES(?, ?) WHERE ID_categoria = ?', [this.texto_pregunta, this.ID_categoria])
    // }
}
