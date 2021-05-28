<div class="container_tarjeta">

    <div class="card_detalle">
        <img src="imagenes/img1.jpg">
        <div class="contenido_detalle">
            <h3>Destino: {$destino->nombre}</h3>
            {foreach from=$paises item=pais}
                {if $pais->id == $destino->id_pais}
                    <p class="info"><span>Pais:</span> {$pais->nombre}</p>
                {/if}
            {/foreach}
            <p class="info"><span>Dias:</span> {$destino->dias}</p>
            <p class="info"><span>Detalles:</span> {$destino->detalle}</p>
            <p class="info"><span>Precio:</span> ${$destino->precio}</p>
            {if $username}
                <a href="formEditarDestino/{$destino->id}">Editar</a>
                <a href="eliminarDestino/{$destino->id}">Eliminar</a>
            {/if}
        </div>
    </div>

</div>