{include file="header.tpl"}
<div class="contenedor">
    <div class="encabezado">
        {include file="nav.tpl"}
    </div>
    <h1>Admin</h1>
    <div class="contenedor_admin">
        {include file="editar.pais.admin.tpl"}
        {include file="agregarpais.tpl"}
    </div>
    <div class="contenedor_admin">
        {include file="editar.destino.admin.tpl"}
        {include file="agregar.destino.tpl"}
    </div>
    <div class="contenedor_admin">
        {include file="eliminar.pais.tpl"}
        {include file="eliminar.destino.tpl"}
    </div>
</div>

{include file="footer.tpl"}