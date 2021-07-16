{include file="header.tpl"}
{include file="nav.tpl"}

<h1 class="text-center destino_detalle">Editar Pais</h1>
<div class="row">
    <div class="col-1 editando">
        <p>EDITAR</p>
    </div>
    <div class="col-11 ">
        <div class="formulario">
            <form method="POST" action="editarPais">
                {if $error}
                    <div class="col-12 bg-danger text-center text-light p-3">
                        *{$error}
                    </div>
                {/if}
                <div class="row justify-content-md-center">
                    <div class="col-4">
                        <label for="pais"> <span>Pais a editar:</span> </label>
                        <select class="form-control" name="pais">
                            <option value="{$pais->id}">{$pais->nombre}</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <label for="name"> <span>Nuevo nombre:</span> </label>
                        <input class="form-control" type="text" id="name" name="name" value="{$pais->nombre}">
                    </div>
                    <div class="row justify-content-md-center m-2">
                        <div class="col-1">
                            <input class="btn btn-warning text-light" type="submit" name="agregar" value="Editar">
                        </div>
                        <div class="col-1">
                        <a class="btn btn-danger" href="home">Cancelar</a>
                        </div>
                    </div>
            </form>
        </div>
    </div>
</div>

{include file="footer.tpl"}