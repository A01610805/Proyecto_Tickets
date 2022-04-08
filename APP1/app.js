const express = require('express');
const path = require('path');
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
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());


const rutas_login = require('./routes/route_login');
const rutas_pp = require('./routes/route_Pp');
const rutas_genticket = require('./routes/route_GenT');
const rutas_visualizacion = require('./routes/route_tickets');

const rutas_busus = require('./routes/route_BuscarU');
const rutas_modtem = require('./routes/route_ModTem');


app.use('/users', rutas_login);
app.use('/home', rutas_pp);
app.use('/generar_ticket', rutas_genticket);
app.use('/buscar_tickets', rutas_visualizacion);

app.use('/buscar_usuario', rutas_busus);
app.use('/modificar_template', rutas_modtem);

// app.get('/GenTem',authRole(1), (req, res) => {
//     res.redirect(GenTem)
// })

app.use((request, response,) => {
    console.log('Middleware!');
    response.redirect('/users');
});


app.use((request, response,next) => {
    console.log("Error 404");
});

app.listen(3000); 
