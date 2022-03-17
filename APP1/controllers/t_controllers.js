const Ticket = require("../models/tickets");

exports.post_nuevo = (request, response, next) => {

    const tick = 
        new Ticket(
            request.body.id, request.body.ti, request.body.cat, request.body.description, 
            request.body.pregunta_uno, request.body.pregunta_dos,  request.body.pregunta_tres);
    tick.save()
        .then(() => {
            request.session.info = tick.id + ' fue registrado con éxito';
            response.setHeader('Set-Cookie', 
                'ultimo_capybara='+tick.id+'; HttpOnly');
            response.redirect('/Primer pantalla');
        })
        .catch(err => console.log(err));
};

exports.listar = (request, response, next) => {
    console.log('Ruta /capybaras');
    //console.log(request.get('Cookie').split('=')[1]);
    console.log(request.cookies);
    const info = request.session.info ? request.session.info : '';
    request.session.info = '';
    Ticket.fetchAll()
        .then(([rows, fieldData]) => {
            console.log(rows);
            response.render('lista', {
                capybaras: rows,
                username: request.session.username ? request.session.username : '',
                ultimo_capybara: request.cookies.ultimo_capybara ? request.cookies.ultimo_capybara : '',
                info: info //El primer info es la variable del template, el segundo la constante creada arriba
            }); 
        })
        .catch(err => {
            console.log(err);
        }); 
}

exports.filtrar = (request, response, next) => {
    console.log(request.params.capybara_id);
    //console.log(request.get('Cookie').split('=')[1]);
    console.log(request.cookies);
    const info = request.session.info ? request.session.info : '';
    request.session.info = '';
    Capybara.fetchOne(request.params.capybara_id)
        .then(([rows, fieldData]) => {
            console.log(rows);
            response.render('lista', {
                capybaras: rows,
                username: request.session.username ? request.session.username : '',
                ultimo_capybara: request.cookies.ultimo_capybara ? request.cookies.ultimo_capybara : '',
                info: info //El primer info es la variable del template, el segundo la constante creada arriba
            }); 
        })
        .catch(err => {
            console.log(err);
        }); 