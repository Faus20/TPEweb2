<div class="container_formulario">

    <div class="formulario">
        <form method="POST" action="eliminarDestino">
            <div class="titulo_formulario">
                Eliminar destino
            </div>
            <div class="fila_formulario">

                <label for="destino"> Seleccionar destino: </label>
                <select name="destino">
                    {foreach from=$destinos item=destino}
                        <option value="{$destino->id}">{$destino->nombre}</option>
                    {/foreach}
                </select>
            </div>
            <div class="fila_formulario">
                <input type="submit" name="editar" value="Eliminar">
            </div>
        </form>
    </div>

</div>