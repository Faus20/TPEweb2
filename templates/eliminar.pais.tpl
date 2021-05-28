<div class="container_formulario">

    <div class="formulario">
        <form method="POST" action="eliminarPais">
            <div class="titulo_formulario">
                Eliminar pais
            </div>
            <div class="fila_formulario">

                <label for="pais"> Seleccionar pais: </label>
                <select name="pais">
                    {foreach from=$paises item=pais}
                        <option value="{$pais->id}">{$pais->nombre}</option>
                    {/foreach}
                </select>
            </div>
            <div class="fila_formulario">
                <input type="submit" name="editar" value="Eliminar">
            </div>
        </form>
    </div>

</div>