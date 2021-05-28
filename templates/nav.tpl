<div class="user">
    {if $username}
        <p>{$username}</p>
    {/if}
</div>

<header>
    <img src="imagenes/logo.png" alt="logo">
</header>
<div class="btn_menu">
    <h1>MENÚ</h1>
</div>
<nav>
    <ul class="navigation">
        <li class="item"><a class="botones" href="home">Home</a></li>
        <li class="item"><a class="botones" href="destinos">Destinos</a></li>
        {if $username}
            <li class="item"><a class="botones" href="admin">Admin</a></li>
            <li class="item_log"><a class="botones" href="logout">Logout</a></li>
        {else}
            <li class="item_log"><a class="botones" href="formRegistro">Registrarse</a></li>
            <li class="item"><a class="botones" href="login">Login</a></li>
        {/if}
    </ul>
</nav>