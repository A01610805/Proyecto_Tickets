const user = require('../models/model_login');


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
                <li>
                <a href="GenTem" class="btn-floating">
                    Generar Template<i class="material-icons">add_circle</i>
                </a>
                </li>
                <li>
                    <a href="ModTem" class="btn-floating">
                        Modificar Template<i class="material-icons">edit</i>
                    </a>
                </li>
            `)
        }

        const $li = document.createElement("li")
        $li.classList.add("grupo")
        $li.innerHTML = templateElement()
        $form.insertBefore($li, $NAV.lastChild)
    }

})()