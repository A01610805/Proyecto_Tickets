const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'zebrands_tickets',
    password: '',
});

module.exports = pool.promise();