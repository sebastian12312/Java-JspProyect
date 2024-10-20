<%-- 
    Document   : index
    Created on : 12 oct. 2024, 13:19:32
    Author     : angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Seguridad Industrial</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body class="text-bg-tertiary-color">
        <nav class="navbar navbar-expand-lg navbar-light bg-warning p-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                  <img src="img/epps.png" alt="Logo" width="40" height="30" class="d-inline-block align-text-top">
                    CORPORATION FOR INDUSTRY
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Productos">Productos</a>

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Nosotros</a>
                        </li>                      
                        <li class="nav-item">
                            <!-- Enlace para abrir el modal -->
                            <%
                                String usuario = (String) session.getAttribute("usuario");
                                if (usuario != null && !usuario.trim().isEmpty()) {
                            %>
                            <a class=" btn btn-primary" href="#"><%=usuario%></a>
                            <a href="${pageContext.request.contextPath}/ValidacionLogin" class="bg-danger">
                                <i class="bi bi-box-arrow-left"></i>
                            </a>
                            <%
                            } else {
                            %>
                            <a class=" btn btn-primary" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
                            <a class="btn btn-primary" href="#" data-bs-toggle="modal" data-bs-target="#registerModal">Registrar</a>
                            <%
                                }
                            %>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Modal de Login -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="loginModalLabel">Iniciar Sesión</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center mb-3">
                    <img src="img/login.jpg" alt="Login" class="img-fluid" style="max-height: 200px;">
                         </div>
                        <form method="POST" action="ValidacionLogin">
                            <div class="mb-3">
                                <label for="email" class="form-label">Numero Documento De Identidad</label>
                                <input type="text" class="form-control" id="email" placeholder="Ingrese su DNI" name="username">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="password" placeholder="Ingrese su contraseña"  name="password" required>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="recordarme">
                                <label class="form-check-label" for="recordarme">Recordarme</label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Iniciar Sesión</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
       <br><br>
       <script>
        document.body.style.backgroundImage = "url('img/fondo2.jpg')";
        document.body.style.backgroundSize = "cover"; // Para cubrir toda la página
        document.body.style.backgroundRepeat = "no-repeat"; // Evita que la imagen se repita
        document.body.style.backgroundPosition = "center"; // Centra la imagen
                </script>
                <div class="text-center mb-3">
                    <img src="img/epps.png" alt="Login" class="img-fluid" style="max-height: 200px;">
                    <h2 class="text-center mb-4" style="font-size: 24px">Somos Corporation For Industry y ofrecemos los mejores equipos de proteccion personal</h2>
                </div>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Nuestros Productos</h2>
   
            <!-- Carousel de Productos -->
            <div id="carouselProductos" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">

                    <!-- Primera Slide -->
                    <div class="carousel-item active">
                        <div class="row justify-content-center">
                            <div class="col-md-3">
                                <div class="card" class="opacity-25">
                                    <img src="img/calzado.jpeg" class="card-img-top" alt="Producto 1">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Botas Punto Acero</h5>
                                        <p class="card-text">S/. 25.00</p>
                                        <button class="btn btn-primary">Comprar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <img src="img/guantes.jpeg" class="card-img-top" alt="Producto 2">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Guantes de Cuero</h5>
                                        <p class="card-text">$30.00</p>
                                        <button class="btn btn-primary">Comprar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <img src="img/chalecos.jpeg" class="card-img-top" alt="Producto 3">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Chalecos</h5>
                                        <p class="card-text">S/. 40.00</p>
                                        <button class="btn btn-primary">Comprar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Segunda Slide -->
                    <div class="carousel-item">
                        <div class="row justify-content-center">
                            <div class="col-md-3">
                                <div class="card">
                                    <img src="img/casco.jpg" class="card-img-top" alt="Producto 4">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Casco</h5>
                                        <p class="card-text">S/. 50.00</p>
                                        <button class="btn btn-primary">Comprar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <img src="img/uniformes.jpeg" class="card-img-top" alt="Producto 5">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Uniforme</h5>
                                        <p class="card-text">S/. 20.00</p>
                                        <button class="btn btn-primary">Comprar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <img src="img/lentes.jpeg" class="card-img-top" alt="Producto 6">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Lentes</h5>
                                        <p class="card-text">S/. 35.00</p>
                                        <button class="btn btn-primary">Comprar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Controles del Carousel -->
                <button class="carousel-control-prev"  type="button" data-bs-target="#carouselProductos" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: black"></span>
                    <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselProductos" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: black"   ></span>
                    <span class="visually-hidden">Siguiente</span>
                </button>
            </div>
        </div>
        <!-- Modal de Registro -->
        <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="registerModalLabel">Registrar Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="RegistrarUsuario"> <!-- Cambia la acción a la URL de tu servidor que maneje el registro -->
                            <div class="mb-3">
                                <label for="dni" class="form-label">DNI</label>
                                <input type="text" class="form-control" id="dni" placeholder="Ingrese su DNI" name="dni" required>
                            </div>
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre" placeholder="Ingrese su nombre" name="nombre" required>
                            </div>
                            <div class="mb-3">
                                <label for="apellido" class="form-label">Apellido</label>
                                <input type="text" class="form-control" id="apellido" placeholder="Ingrese su apellido" name="apellido" required>
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Correo Electrónico</label>
                                <input type="email" class="form-control" id="correo" placeholder="Ingrese su correo" name="correo" required>
                            </div>
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="text" class="form-control" id="telefono" placeholder="Ingrese su teléfono" name="telefono">
                            </div>
                            <div class="mb-3">
                                <label for="contrasena" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="contrasena" placeholder="Ingrese su contraseña" name="contrasena" required>
                            </div>
                            <div class="mb-3">
                                <label for="genero" class="form-label">Género</label>
                                <select class="form-select" id="genero" name="genero" required>
                                    <option value="" disabled selected>Seleccione su género</option>
                                    <option value="1">Masculino</option>
                                    <option value="2">Femenino</option>
                                    <option value="3">Otro</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Registrar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>