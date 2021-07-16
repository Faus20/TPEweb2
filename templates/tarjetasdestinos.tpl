{foreach from=$destinos item=destino}
    <div class="col-4 mt-3">
        <div class="card-group">
            <div class="card">
                <img src="./{$destino->imagen}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h4 class="card-title"><span>{$destino->nombre}</span></h4>
                    <p class="card-text">Precio: ${$destino->precio}</p>
                    <a class="badge bg-primary p-3" href="detalle/{$destino->id}">Detalles</a>
                    {if $admin == 2}
                        <a class="badge bg-warning p-3" href="formEditarDestino/{$destino->id}">Editar</a>
                        <a class="badge bg-danger p-3" href="eliminarDestino/{$destino->id}">Eliminar</a>
                    {/if}
                </div>
                {if $admin == 2}
                    <a class="badge bg-danger p-2 portada_destino" href="eliminarPortada/{$destino->id}">Eliminar Portada</a>
                {/if}
            </div>
        </div>
    </div>
{/foreach}