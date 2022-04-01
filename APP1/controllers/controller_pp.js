exports.principal = (request, response, next) => {
    console.log('Pantalla principal');
    response.render('Primer_pantalla', {
        username: request.session.name ? request.session.name : ''
    }); 
}