const path = require('path');
const user = require('../models/model_login');
const bcrypt = require('bcryptjs');
const { request } = require('http');


let parameters = []


const addJsonElement = json => {
    parameters.push(json)
    return parameters.length - 1
}

(function load(){
    if(user.ID_rol == 1){
        const $NAV = document.getElementById("nav-mobile")
        const templateElement = () => {
            return (`
                
            `)
        }

        const $li = document.createElement("li")
        $li.innerHTML = templateElement()
        $form.insertBefore($li, $NAV.lastChild)
    }

})()