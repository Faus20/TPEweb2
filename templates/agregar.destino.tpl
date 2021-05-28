<div class="container_formulario">

    <div class="formulario">
        <form method="POST" action="agregarDestino">
            <div class="titulo_formulario">
                Cargar destino
            </div>

            <div class="fila_formulario">
                <label for="name"> Nombre </label>
                <input type="text" id="name" name="name" value="">
            </div>
            <div class="fila_formulario">
                <label for="destino"> Pais:: </label>
                <select name="pais">
                    {foreach from=$paises item=pais}
                        <option value="{$pais->id}">{$pais->nombre}</option>
                    {/foreach}
                </select>
            </div>
            <div class="fila_formulario">
                <label for="dias">Dias: </label>
                <input type="number" id="number" name="dias" value="">
            </div>
            <div class="fila_formulario">
                <label for="precio">Precio: </label>
                <input type="number" step="any" id="number" name="precio" value="">
            </div>
            <div class="fila_formulario">
                <label for="detail"> Detalles: </label>
            </div>
            <div class="fila_formulario">
                <textarea name="detail" cols="30" rows="10" placeholder="Especifique detalles del destino"></textarea>
            </div>
            <div class="fila_formulario">
                <input type="submit" name="agregar" value="Cargar">
            </div>
        </form>
    </div>

</div>