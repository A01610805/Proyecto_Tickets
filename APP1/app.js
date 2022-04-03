//aqui se ponen las librerias necesarias
//express framework para crear web
const express = require('express');
// path nos permite poder manejar las rutas tanto relativas 
// como absolutas de nuestra PC y de nuestro proyecto.
// path al igual que otros módulos cuenta con muchísimos 
// métodos, no los quieras aprender todos de golpe, aprender los 
// más usados y a medida que avances con Node podrás conocer 
// más métodos.
const path = require('path');
// Para manejar la solicitud de HTTP POST en Express.js version 4
//  y superior, necesita instalar un módulo de middleware llamado 
// body-parser. body-parser extrae toda la parte del cuerpo de una 
// secuencia de solicitud entrante y la expone en req.body.
const bodyParser = require('body-parser');

const cookieParser = require('cookie-parser');
const session = require('express-session');
//const placeholder = require('placeholder-loading');

//const {authRole} = require('./controllers/authR');

const app = express();

app.use(express.json());
app.use(cookieParser());

//app.use(placeholder());

app.use(session({
    secret: 'qweasdzxc',
    resave: false, //La sesión no se guardará en cada petición, sino sólo se guardará si algo cambió 
    saveUninitialized: false, //Asegura que no se guarde una sesión para una petición que no lo necesita
}));

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(bodyParser.urlencoded({ extended: false }));



//Estas son las rutas a utilizar se utiliza una constante poara almacenar la direccion de la rutas
//despues se utiliza en un app.use completo
const rutas_login = require('./routes/route_login');
const rutas_pp = require('./routes/route_Pp');
const rutas_genticket = require('./routes/route_GenT');
const rutas_busus = require('./routes/route_BuscarU');

app.use('/users', rutas_login);
app.use('/home', rutas_pp);
app.use('/generar_ticket', rutas_genticket);
app.use('/buscar_usuario', rutas_busus);

// app.get('/GenTem',authRole(1), (req, res) => {
//     res.redirect(GenTem)
// })

app.use((request, response, ) => {
    console.log('Middleware!');
    response.redirect('/users');
});

app.use((request, response, next) => {
    console.log("Error 404");
});

app.listen(3000);