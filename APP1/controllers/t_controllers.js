const Ticket = require("../models/tickets");

exports.post_nuevo = (request, response, next) => {

    const ticket = 
        new Ticket(
            request.body.id, request.body.description, 
            request.body.pregunta_uno, request.body.pregunta_dos,  request.body.pregunta_tres);
    ticket.save()
        .then(() => {
            request.session.info = capybara.nombre + ' fue registrado con éxito';
            response.setHeader('Set-Cookie', 
                'ultimo_capybara='+capybara.nombre+'; HttpOnly');
            response.redirect('/capybaras');
        })
        .catch(err => console.log(err));
};