const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const {authRole} = require('./controllers/authR');

const app = express();

app.use(express.json());
app.use(cookieParser());
app.use(session({
    secret: 'qweasdzxc', 
    resave: false, //La sesión no se guardará en cada petición, sino sólo se guardará si algo cambió 
    saveUninitialized: false, //Asegura que no se guarde una sesión para una petición que no lo necesita
}));

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(bodyParser.urlencoded({extended: false}));

const rutas_login = require('./routes/route_login');
//const rutas_login = require('./routes/route_login');

/*
app.use((request, response, next) => {
    console.log("Inicio de la aplicación");
    response.render('Primer pantalla',{
        username: request.session.username ? request.session.username : ''
    });
});*/

app.use('/users', rutas_login);

app.use((request, response,) => {
    console.log('Middleware!');
    response.redirect('/users');
});
/*
app.use((request, response, next) => {
    console.log("Pagina, Pantalla_principal");
    response.render('principal',{
        username: request.session.username ? request.session.username : ''
    });
});*/

app.get('/GenTem',authRole(1), (req, res) => {
    res.redirect(GenTem)
})

app.use((request, response,next) => {
    console.log("Error 404");
});

app.listen(3000); 