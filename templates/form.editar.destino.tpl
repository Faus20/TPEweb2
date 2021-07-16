{include file="header.tpl"}

{include file="nav.tpl"}
<h1 class="text-center destino_detalle">{$destino->nombre}</h1>
<div class="row">
    <div class="col-1 editando">
        <p>EDITANDO</p>
    </div>
    <div class="col-11 ">
        <div class="formulario">
            <form method="POST" action="editarDestino" enctype="multipart/form-data">
            {if $error}
                <div class="col-12 bg-danger text-center text-light p-3">
                    *{$error}
                </div>
            {/if}
                <div class="row justify-content-md-center">
                    <div class="col-4">
                        <label for="destino"> <span>Destino a editar:</span> </label>
                        <select class="form-control" name="destino">
                            <option value="{$destino->id}">{$destino->nombre}</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <label for="name"> <span>Nuevo nombre:</span> </label>
                        <input class="form-control" type="text" id="name" name="name" value="{$destino->nombre}">
                    </div>
                </div>
                <div class="row justify-content-md-center">
                    <div class="col-4">
                        <label for="dias"><span>Dias:</span> </label>
                        <input class="form-control" type="number" id="number" name="dias" value="{$destino->dias}">
                    </div>
                    <div class="col-4">
                        <label for="precio"><span>Precio:</span> </label>
                        <input class="form-control" type="number" step="any" id="number" name="precio"
                            value="{$destino->precio}">
                    </div>
                </div>
                <div class="row justify-content-md-center">
                <div class="col-8 m-1">
                    <label for="imagen"> <span>Subir imagen:</span> </label>
                    <input class="form-control" type="file" step="any" id="imageToUpload" name="imagen">
                    </div>
                 </div>
                <div class="row justify-content-md-center">
                    <div class="col-4">
                        <label for="detail"> <span>Detalles:</span> </label>
                        <textarea class="form-control" name="detail" cols="30" rows="10">{$destino->detalle}</textarea>
                    </div>
                </div>
                <div class="row justify-content-md-center m-2">
                    <div class="col-1">
                        <input class="btn btn-warning text-light" type="submit" name="editar" value="Editar">
                    </div>
                    <div class="col-1">
                        <a class="btn btn-danger" href="home">Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</div>
</div>
{include file="footer.tpl"}