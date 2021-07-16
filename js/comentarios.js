"use strict";

let admin = document.getElementById('destino').getAttribute('admin');
let usuarix = document.getElementById('destino').getAttribute('usuarix');

let cargar_comentarios = new Vue({
    el: "#template-vue-comentarios",
    data: {
        titulo: "Comentarios",
        comentarios: [],
        admin: admin
    },
    methods: {
        /** 
         * @param id del comentario.
         *  Eliminar un comentario.
         */
        eliminar_comentario: function (id) {
            fetch('api/comentario/' + id, { 

            "method": "DELETE",
            "mode": 'cors',
        })
        .then(respuesta => {
            if (respuesta.ok)
                obtenerComentarios();
            else
                console.log("error al eliminar");
        })
        .catch(err => {
            console.log(err);
        })
    }
}
});

let postear_comentarios = new Vue({
    el: "#template-vue-postear",
    data: {
        titulo: "Deja tu comentario",
        admin: admin,
        usuarix: usuarix,
        comentario: null,
        puntaje: null,
        errors: [],
    },
    methods: {
        checkForm: function (e) {
            e.preventDefault();
            if (this.comentario && this.puntaje) {
                postear_comentario(comentario.value, puntaje.value);
                this.errors = [];
                return true;
            }
            this.errors = [];

            if (!this.comentario) {
                this.errors.push('El comentario no puede estar vacio.');
            }

            if (!this.puntaje) {
                this.errors.push('El puntaje es obligatorio');
            }
        }
    }
});

/**
 * @param comentario
 * @param puntaje
 * Funcion para postear comentario.
 */
function postear_comentario(comentario, puntaje) {
    let id = obtener_id_destino();

    // defino el JSON con los datos proporcionados por el usuarix y el id del destino.
    let comentario_usuarix = {
        nombre: usuarix,
        comentario: comentario,
        puntaje: puntaje,
        id_destino: id
    };
    // eviar JSON a la API para que se encargue de registrar el comentario en la base de datos. 
    fetch('api/comentario', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(comentario_usuarix)
    })
        .then((response) => {
            if (response.ok)
                console.log('ok');
            else
                alert('error al postear comentario');
        })
        .then(response => {
            postear_comentarios.comentario = null;
            postear_comentarios.puntaje = null;

            obtenerComentarios();
        })
        .catch(exception => console.log(exception));

}

function obtenerComentarios() {
    //obtengo el id del destino, para buscar los comentarios que tenga ese solo destino
    let id = obtener_id_destino();
    fetch('api/comentarios/' + id)
        .then(response => response.json())
        .then(comentarios => {
            cargar_comentarios.comentarios = comentarios; // similar a $this->smarty->assign("tasks", $tasks)
        
        })
        .catch(error => console.log(error));
}

function obtener_id_destino() {
    let id = document.getElementById('destino').getAttribute('destino-id');
    return id
}

obtenerComentarios()
