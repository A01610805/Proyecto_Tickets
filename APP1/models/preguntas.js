const db = require('../util/database');

module.exports = class Pregunta {
    constructor(texto_pregunta, ID_categoria, ID_pregunta) {
        this.texto_pregunta = texto_pregunta;
        this.ID_categoria = ID_categoria;
        this.ID_pregunta = ID_pregunta;

    }

    // constructor(ID_pregunta, ID_categoria, texto_pregunta) {
    //     this.ID_pregunta = ID_pregunta;
    //     this.ID_categoria = ID_categoria;
    //     this.texto_pregunta = texto_pregunta;
    //  }

    static fetchPreguntas(id) {
        return db.execute(
            'SELECT * FROM pregunta WHERE ID_categoria=?', [id]);
    }
<<<<<<< HEAD

    static idpreg(id) {
=======
    
    idpreg(id){
>>>>>>> 307171d521586ba6900f349b0ef4600271bab660
        return db.execute(
            'SELECT ID_pregunta FROM pregunta WHERE ID_categoria=?', [id]);
    }

<<<<<<< HEAD
    static countpreg(id) {
        return db.execute(
            'SELECT COUNT(*) FROM pregunta WHERE ID_categoria = ?', [id]);
    }
    update() {
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
=======
    countpreg(id){
        return db.execute(
            'SELECT COUNT(*) FROM pregunta WHERE ID_categoria = ?', [id]);
    }
}
>>>>>>> 307171d521586ba6900f349b0ef4600271bab660
