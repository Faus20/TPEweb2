{include file="header.tpl"}
<div class="contenedor">
    <div class="encabezado">
        {include file="nav.tpl"}
    </div>
    <h1>{$destino->nombre}</h1>
    <div class="contenedor_destinos">
        {include file="listapaises.tpl"}
        {include file="tarjetadetalle.tpl"}
    </div>
</div>
{include file="footer.tpl"}