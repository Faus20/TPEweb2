{include file="header.tpl"}

    {include file="nav.tpl"}
    {include file="carrousel.tpl"}
<div class="contenedor">
    <div class="row">
        <div class="col-9">
            <div class="encabezado_destinos">
                <h1>Destinos</h1>
                {if $admin == 2}
                    <a class="badge bg-primary p-3 boton_agregar" href="formAgregarDestino">Agregar destino</a>
                {/if}
            </div>
            <div class="row">
                {include file="tarjetasdestinos.tpl"}
            </div>
        </div>
        <div class="col-3">
            <div class="encabezado_filtros">
                <h1>Filtrar</h1>
                {if $admin == 2}

                    <a class="badge bg-danger p-3" href="formAgregarPais">Agregar pais</a>
                    <div class="subrayado"></div>
                    <div class="row mt-1">
                        <div class="col-6">
                            <form method="POST" action="formEditarPais">
                                <div class="form-floating">
                                    <select name="pais" class="form-select" id="floatingSelect"
                                        aria-label="Floating label select example">
                                        {foreach from=$paises item=pais}
                                            <option value="{$pais->id}">{$pais->nombre}</option>
                                        {/foreach}
                                    </select>
                                    <label for="floatingSelect">Editar pais</label>
                                </div>
                        </div>
                        <div class="col-6">
                            <button type="submit" class="btn btn-warning text-light">Editar</button>
                        </div>
                        </form>
                    </div>
                     <div class="row ">
                        <div class="col-6">
                            <form method="POST" action="eliminarPais">
                                <div class="form-floating">
                                    <select name="pais" class="form-select" id="floatingSelect"
                                        aria-label="Floating label select example">
                                        {foreach from=$paises item=pais}
                                            <option value="{$pais->id}">{$pais->nombre}</option>
                                        {/foreach}
                                    </select>
                                    <label for="floatingSelect">Eliminar pais</label>
                                </div>
                        </div>
                        <div class="col-6">
                            <button type="submit" class="btn btn-danger">Eliminar</button>
                        </div>
                        </form>
                    </div>

                {/if}
                <div class="subrayado"></div>
                <div class="row">
                    {include file="filtros.tpl"}
                </div>
            </div>
        </div>
    </div>
</div>
{include file="footer.tpl"}