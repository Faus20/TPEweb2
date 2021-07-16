<div class="col-1 detallado">
 <p>DETALLES</p>
</div>
<div class="col-11">

    <div class="card mb-3" id="destino" destino-id="{$destino->id}" admin = "{$admin}" usuarix= "{$username}">
        <div class="row g-0">
            <div class="col-md-5">
                <img class="img-thumbnail" src="./{$destino->imagen}" alt="...">
            </div>
            <div class="col-md-7">
                <div class="card-body">
                <p class="card-text"> <span>Destino: </span> {$destino->nombre}</p>
                    {foreach from=$paises item=pais}
                        {if $pais->id == $destino->id_pais}
                            <p class="card-text"> <span>Pais: </span> {$pais->nombre}</p>
                        {/if}
                    {/foreach}
                    <p class="card-text"> <span>Dias: </span> {$destino->dias}</p>
                    <p class="card-text"> <span>Detalles: </span> {$destino->detalle}</p>
                    <p class="card-text"> <span>Precio: </span> ${$destino->precio}</p>
                    <a class="badge bg-primary p-3" href="home">Volver</a>
                    {if $admin == 2}
                        <a class="badge bg-warning p-3" href="formEditarDestino/{$destino->id}">Editar</a>
                        <a class="badge bg-danger p-3" href="eliminarDestino/{$destino->id}">Eliminar</a>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>

{include file="vue/comentario.tpl"}
<script src="js/comentarios.js"></script>