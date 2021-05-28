<div class="container_paises">
<h3>Lista de paises</h3>
    <div class="lista">
    <ul>
        {foreach from=$paises item=pais} 
            <li class="pais"> <a href="pais/{$pais->id}">{$pais->nombre}</a>
            {if $username}
                <a class="boton_lista" href="formEditarPais/{$pais->id}">Editar</a>
                <a class="boton_lista" href="eliminarPais/{$pais->id}">Eliminar</a>
            {/if}
            </li>
        {/foreach}
        
    </ul>
    </div>

</div>