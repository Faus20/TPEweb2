<div class="container_tarjeta">
    {foreach from=$destinos item=destino}
        <div class="card">
            <img src="imagenes/img1.jpg">
            <div class="content">
                <h3>{$destino->nombre}</h3>
                <h4>Precio: ${$destino->precio}</h4>
                <a href="detalle/{$destino->id}">Detalles</a>
                {if $username}
                    <a href="formEditarDestino/{$destino->id}">Editar</a>
                    <a href="eliminarDestino/{$destino->id}">Eliminar</a>
                {/if}
            </div>
        </div>
    {/foreach}
</div>