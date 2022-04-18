const db = require('../util/database');

module.exports = class Metricas {



    // static tiemposCat() {
    //     return db.execute(
    //         'SELECT nombre_categoria,(AVG((UNIX_TIMESTAMP(fecha_fin) - UNIX_TIMESTAMP(fecha_emision)) DIV 86400)) as "Tiempo promedio solucion (dias)" FROM categoria C, ticket T, genera_ticket GT, resuelve_ticket RT WHERE T.ID_categoria = C.ID_categoria AND T.ID_ticket = GT.ID_ticket AND T.ID_ticket = RT.ID_ticket GROUP BY T.ID_categoria ORDER BY nombre_categoria ASC'
    //     );
    // }
    static tiemposCat() {
        return db.execute(
            'SELECT (AVG((UNIX_TIMESTAMP(fecha_fin) - UNIX_TIMESTAMP(fecha_emision)) DIV 86400)) FROM categoria C, ticket T, genera_ticket GT, resuelve_ticket RT WHERE T.ID_categoria = C.ID_categoria AND T.ID_ticket = GT.ID_ticket AND T.ID_ticket = RT.ID_ticket GROUP BY T.ID_categoria ORDER BY nombre_categoria ASC'
        );
    }

    static nombresCat() {
        return db.execute(
            'SELECT nombre_categoria FROM categoria C ORDER BY nombre_categoria ASC'
        );
    }

}