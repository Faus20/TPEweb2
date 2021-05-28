{include file="header.tpl"}
<div class="encabezado">
    {include file="nav.tpl"}
</div>
<div class="container_form_edit">

    <div class="formulario">
        <form method="POST" action="editarDestino">
            <div class="titulo_formulario">
                Editando {$destino->nombre}
            </div>
            <div class="fila_formulario">

                <label for="destino"> Destino a editar: </label>
                <select name="destino">
                    <option value="{$destino->id}">{$destino->nombre}</option>
                </select>
            </div>
            <div class="fila_formulario">
                <label for="name"> Nuevo nombre: </label>
                <input type="text" id="name" name="name" value="{$destino->nombre}">
            </div>
            <div class="fila_formulario">
                <label for="dias">Dias: </label>
                <input type="number" id="number" name="dias" value="{$destino->dias}">
            </div>
            <div class="fila_formulario">
                <label for="precio">Precio: </label>
                <input type="number" step="any" id="number" name="precio" value="{$destino->precio}">
            </div>
            <div class="fila_formulario">
                <label for="detail"> Detalles: </label>
            </div>
            <div class="fila_formulario">
                <textarea name="detail" cols="30" rows="10">{$destino->detalle}</textarea>
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