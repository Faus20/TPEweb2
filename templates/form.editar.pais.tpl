{include file="header.tpl"}
<div class="encabezado">
    {include file="nav.tpl"}
</div>
<div class="container_form_edit">

    <div class="formulario">
        <form method="POST" action="editarPais">
            <div class="titulo_formulario">
                Editando {$pais->nombre}
            </div>
            <div class="fila_formulario">
                <label for="pais"> Pais a editar: </label>
                <select name="pais">
                    <option value="{$pais->id}">{$pais->nombre}</option>
                </select>
            </div>
            <div class="fila_formulario">
                <label for="name"> Nuevo nombre: </label>
                <input type="text" id="name" name="name" value="{$pais->nombre}">
            </div>
            <div class="fila_formulario">
                <input type="submit" name="editar" value="Editar">
            </div>
            {if $error}
                <div class="error">
                    *{$error}
                </div>
            {/if}
        </form>
    </div>
</div>
{include file="footer.tpl"}