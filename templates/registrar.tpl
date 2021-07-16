<!DOCTYPE html>
<html lang="en">

<head>
    <base href={$url}>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="icon" href="imagenes/icono.png" />
    <link href="https://fonts.googleapis.com/css?family=Anton|Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
    <title>{$title}</title>
</head>
<body class="login_fondo">

    <div class="modal-dialog text-center">
        <div class="col-sm-8 main-section">
            <div class="modal-content">
                <div class="col-12 user-img">
                    <img src="imagenes/user.png" />
                </div>
                <div class="text-center titulo_login">
                    <h1>Registrarse</h1>
                </div>
                <form class="col-12" action="registrar" method="POST">
                    <div class="form-group" id="user-group">
                        <input type="text" class="form-control" placeholder="Nombre de usuario" name="username" />
                    </div>
                    <div class="form-group" id="contrasena-group">
                        <input type="password" class="form-control" placeholder="Contrasena" name="password" />
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> Registrarse
                    </button>
                    <div class="form-group">
                    <a class="text-light" href="home">Ingresar como invitadx</a>
                        {if $error}
                            <div class="error_login">
                                *{$error}
                            </div>
                        {/if}
                    </div>
                </form>
            </div>
        </div>
    </div>
    </body>