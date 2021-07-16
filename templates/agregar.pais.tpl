{include file="header.tpl"}

{include file="nav.tpl"}
<h1 class="text-center destino_detalle">Nuevo Pais</h1>
<div class="row">
    <div class="col-1 editando">
        <p>AGREGAR</p>
    </div>
    <div class="col-11 ">
        <div class="formulario">
            <form method="POST" action="agregarPais">
            {if $error}
                <div class="col-12 bg-danger text-center text-light p-3">
                    *{$error}
                </div>
            {/if}
                <div class="row justify-content-md-center">
                <div class="col-4">
                <label for="name"> <span>Nombre:</span> </label>
                <input class="form-control" type="text" id="name" name="name">
                </div>
                <div class="row justify-content-md-center">
                    <div class="col-1 m-1">
                        <input class="btn btn-warning text-light" type="submit" name="agregar" value="Agregar">
                    </div>
                    <div class="col-1 m-1">
                        <a class="btn btn-danger" href="home">Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

{include file="footer.tpl"}
