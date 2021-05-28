{include file="header.tpl"}
<div class="login_fondo">
    <div class="login-box">
        <img src="imagenes/icono2.png" class="avatar" alt="Avatar Image">
        <h1>Login Admin</h1>
        <form action="registrar" method="POST">
            <!-- USERNAME INPUT -->
            <label for="username">Username</label>
            <input name="username" type="text" placeholder="Enter Username">
            <!-- PASSWORD INPUT -->
            <label for="password">Password</label>
            <input name="password" type="password" placeholder="Enter Password">
            <input type="submit" value="Registrarse">
            <a href="home">Volver a la pagina</a>
            {if $error}
                <div class="error_login">
                    *{$error}
                </div>
            {/if}
        </form>
    </div>
</div>