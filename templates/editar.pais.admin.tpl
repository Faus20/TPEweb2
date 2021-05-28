<div class="container_formulario">

    <div class="formulario">
        <form method="POST" action="formEditarPais">
            <div class="titulo_formulario">
                Editar pais
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
                <input type="submit" name="editar" value="Ir a edicion">
            </div>
        </form>
    </div>
</div>