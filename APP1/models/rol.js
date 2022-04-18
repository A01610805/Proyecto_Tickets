const db = require('../util/database');

 module.exports = class Rol {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    // constructor(ID_rol, nombre_rol) {
    //     this.ID_rol = ID_rol;
    //     this.nombre = nombre_rol;
    // }


<<<<<<< HEAD
    static fetchAll(valor) {
        return db.execute('SELECT nombre_rol FROM rol WHERE (nombre_rol LIKE ?)', [valor]
=======
    static findOne() {
        return db.execute('SELECT nombre_rol FROM rol ',
>>>>>>> 307171d521586ba6900f349b0ef4600271bab660
        );
    }
}