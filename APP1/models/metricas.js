const db = require('../util/database');

module.exports = class Metricas {



    // static tiemposCat() {
    //     return db.execute(
    //         'SELECT nombre_categoria,(AVG((UNIX_TIMESTAMP(fecha_fin) - UNIX_TIMESTAMP(fecha_emision)) DIV 86400)) as "Tiempo promedio solucion (dias)" FROM categoria C, ticket T, genera_ticket GT, resuelve_ticket RT WHERE T.ID_categoria = C.ID_categoria AND T.ID_ticket = GT.ID_ticket AND T.ID_ticket = RT.ID_ticket GROUP BY T.ID_categoria ORDER BY nombre_categoria ASC'
    //     );
    // }
    static tiemposCat() {
        return db.execute(
            'SELECT (AVG((UNIX_TIMESTAMP(fecha_fin) - UNIX_TIMESTAMP(fecha_emision)) DIV 86400)) as info_metrica FROM categoria C, ticket T, genera_ticket GT, resuelve_ticket RT WHERE T.ID_categoria = C.ID_categoria AND T.ID_ticket = GT.ID_ticket AND T.ID_ticket = RT.ID_ticket GROUP BY T.ID_categoria ORDER BY nombre_categoria ASC'
        );
    }

    static nombresCat() {
        return db.execute(
            'SELECT nombre_categoria FROM categoria C ORDER BY nombre_categoria ASC'
        );
    }

    static fechas(){
        return db.execute(
            'SELECT CURRENT_DATE as Fechas UNION ALL SELECT (CURRENT_DATE() - INTERVAL 1 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 2 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 3 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 4 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 5 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 6 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 7 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 8 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 9 WEEK)UNION ALL SELECT (CURRENT_DATE() - INTERVAL 10 WEEK)')
    }

    static ticketsemitidos(){
        return db.execute('SELECT count(*) FROM genera_ticket as g GROUP BY g.fecha_emision');
    }

    static ticketsresueltos(){
        return db.execute('SELECT count(fecha_fin) FROM resuelve_ticket GROUP BY fecha_fin');
    }
}