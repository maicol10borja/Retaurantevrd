<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Logeo</title>


</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <!-- Formulario de Login con animación -->
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white">
                    <h3 class="text-center"><i class="fas fa-user-lock"></i> Iniciar Sesión</h3>
                </div>
                <div class="card-body">
                    <form action="/Retaurante/login" method="post">
                        <!-- Campo Username con icono -->
                        <div class="form-group">
                            <label for="username">Username</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" name="username" id="username" class="form-control" placeholder="Ingrese su nombre de usuario" required>
                            </div>
                        </div>

                        <!-- Campo Password con icono -->
                        <div class="form-group">
                            <label for="password">Password</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" name="password" id="password" class="form-control" placeholder="Ingrese su contraseña" required>
                            </div>
                        </div>

                        <!-- Botón Enviar con animación -->
                        <div class="form-group text-center">
                            <input type="submit" value="Iniciar Sesión" class="btn btn-primary btn-block py-2">
                        </div>
                    </form>
            </div>
        </div>
    </div>
</div>



</body>
</html>
