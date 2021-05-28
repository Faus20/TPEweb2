<div class="container_formulario">

    <div class="formulario">
        <form method="POST" action="formEditarDestino">
            <div class="titulo_formulario">
                Editar destino
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
                <input type="submit" name="editar" value="Ir a edicion">
            </div>
        </form>
    </div>

</div>