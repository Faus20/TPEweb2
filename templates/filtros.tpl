<div class="filtros">
    <!-- Filtro para destinos por pais -->
    <form method="POST" action="filtrarPais">
        <div class="row">
            <div class="col-10">
                <div class="form-floating">
                    <select name="pais" class="form-select" id="floatingSelect"
                        aria-label="Floating label select example">
                        <option value="todos" selected>Todos</option>
                        {foreach from=$paises item=pais}
                            <option value="{$pais->id}">{$pais->nombre}</option>
                        {/foreach}
                    </select>
                    <label for="floatingSelect">Filtrar por pais</label>
                </div>
            </div>
            <div class="col-2 boton">
                <button type="submit" class="btn btn-primary boton_busqueda"><i class="fas fa-search"></i></button>
            </div>
        </div>
    </form>

    <!-- Filtro para destinos por nombre -->
    <form method="POST" action="filtrarNombre">
        <div class="row">
            <div class="col-10">
                <div class="form-floating">
                    <input name="busqueda" class="form-control" id="floatingSearch"> 
                    <label for="floatingSearch">Filtrar por nombre</label>
                </div>
            </div>
            <div class="col-2 boton">
                <button type="submit" class="btn btn-primary boton_busqueda"><i class="fas fa-search"></i></button>
            </div>
        </div>
    </form>

    <!-- Filtro para destinos por precio-->
    <form method="POST" action="filtrarPrecio">
    <div class="row">
        <div class="col-10">
            <div class="form-floating">
                <select name="precio" class="form-select" id="floatingSelect"
                    aria-label="Floating label select example">
                        <option value="menor">Menor precio</option>
                        <option value="mayor">Mayor precio</option>
                </select>
                <label for="floatingSelect">Filtrar por precio</label>
            </div>
        </div>
        <div class="col-2 boton">
            <button type="submit" class="btn btn-primary boton_busqueda"><i class="fas fa-search"></i></button>
        </div>
    </div>
</form>
</div>
<div class="subrayado"></div>

