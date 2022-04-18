function authRole(role) {
    return (req, res, next) => {
        if (req.user.ID_rol !== role) {
            res.status(403)
<<<<<<< HEAD
=======
            console.log('esta madre funciona')
>>>>>>> Int-RBAC
        }
    }
}

module.exports = {
    authRole
}