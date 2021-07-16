{include file="header.tpl"}

{include file="nav.tpl"}
<h1 class="text-center destino_detalle">Nuevo Destino</h1>
<div class="row">
    <div class="col-1 editando">
        <p>AGREGAR</p>
    </div>
    <div class="col-11 ">
        <div class="formulario">
            <form method="POST" action="agregarDestino" enctype="multipart/form-data">
            {if $error}
                <div class="col-12 bg-danger text-center text-light p-3">
                    *{$error}
                </div>
            {/if}
                <div class="row justify-content-md-center ">
                <div class="col-4 m-1">
                <label for="name"> <span>Nombre:</span> </label>
                <input class="form-control" type="text" id="name" name="name">
                </div>
                <div class="col-4 m-1">
                    <label for="destino"> <span>Pais:</span> </label>
                    <select class="form-control" name="pais">
                    {foreach from=$paises item=pais}
                        <option value="{$pais->id}">{$pais->nombre}</option>
                    {/foreach}
                </select>
                </div>
                </div>
                <div class="row justify-content-md-center">
                    <div class="col-4 m-1">
                        <label for="dias"><span>Dias:</span> </label>
                        <input class="form-control" type="number" id="number" name="dias" >
                    </div>
                    <div class="col-4 m-1">
                        <label for="precio"><span>Precio:</span> </label>
                        <input class="form-control" type="number" step="any" id="number" name="precio">
                    </div>
                </div>
                <div class="row justify-content-md-center">
                <div class="col-8 m-1">
                    <label for="imagen"> <span>Subir imagen:</span> </label>
                    <input class="form-control" type="file" step="any" id="imageToUpload" name="imagen">
                    </div>
                 </div>
                <div class="row justify-content-md-center">
                    <div class="col-4 m-1">
                        <label for="detail"> <span>Detalles:</span> </label>
                        <textarea class="form-control" name="detail" cols="30" rows="10" placeholder="Especifique detalles del destino"></textarea>
                    </div>
                </div>
                <div class="row justify-content-md-center">
                    <div class="col-1 m-1">
                        <input class="btn btn-warning text-light" type="submit" name="agregar" value="Agregar">
                    </div>
                    <div class="col-1 m-1" >
                        <a class="btn btn-danger" href="home">Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

{include file="footer.tpl"}
