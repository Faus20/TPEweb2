{include file="header.tpl"}

{include file="nav.tpl"}
<h1 class="text-center destino_detalle">Usuarixs</h1>
{if $admin == 2}
<div class="container-fluid ">
<table class="table table-dark table-striped text-center">
    <thead>
        <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Admin</th>
            <th scope="col">Eliminar usuarix</th>
            <th scope="col">Cambiar permisos</th>
        </tr>
    </thead>
    <tbody>
    {foreach from=$usuarixs item=usuarix}
        {if $usuarix->nombre != $username}
            <tr>
                <td> {$usuarix->nombre}</td>
                {if $usuarix->admin == 2}
                    <td><span class="material-icons text-success">
                            done_all
                        </span></td>
                {else}
                    <td>
                        <span class="material-icons text-danger">
                            remove_done
                        </span>
                    </td>
                {/if}
                <td><a class="badge bg-danger p-2" href="eliminarUsuarix/{$usuarix->id}">Eliminar</a></td>
                <td><a class="badge bg-warning p-2" href="editarPermisos/{$usuarix->id}">Cambiar Rol</a></td>
            </tr>
        {/if}
        {/foreach}
    </tbody>
</table>
</div>
{/if}

{include file="footer.tpl"}