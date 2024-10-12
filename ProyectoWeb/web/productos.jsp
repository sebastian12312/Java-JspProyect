<%@page import="clases.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Productos - Mi Empresa</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="https://via.placeholder.com/50" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
                    Mi Empresa
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="http://localhost:8080/ProyectoWeb/">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Productos</a>
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

                            <%
                            } else {
                            %>
                            <a class=" btn btn-primary" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>

                            <%
                                }
                            %>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Cards de Productos -->
        <div class="container my-5">
            <h2 class="text-center mb-4">Nuestros Productos</h2>
            <div class="row g-4">
<%
    List<Producto> productosActivos = (List<Producto>) session.getAttribute("productosActivos");
%>
                <!-- Card de Productos -->
    <%
        if (productosActivos != null) {
            for (Producto producto : productosActivos) {
    %>
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card h-100">
                        <img src="https://th.bing.com/th/id/OIP.H1gHhKVbteqm1U5SrwpPgwAAAA?rs=1&pid=ImgDetMain" class="card-img-top" alt="<%= producto.getNombre() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= producto.getNombre() %></h5>
                            <p class="card-text"><%= producto.getDescripcion() %></p>
                            <p class="mb-2"><strong>Precio:</strong> S/ <%= producto.getPrecio() %></p>
                            <p class="mb-2"><strong>Stock:</strong> <%= producto.getStock() %> unidades</p>
                            <button class="btn btn-primary w-100"><i class="bi bi-cart-plus"></i> Agregar al carrito</button>
                        </div>
                    </div>
                </div>
    <%
            }
        } else {
    %>
            <div class="col-12">
                <p>No hay productos disponibles.</p>
            </div>
    <%
        }
    %>
            </div>
        </div>

        <!-- Modal de Login -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="loginModalLabel">Iniciar Sesión</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="ValidacionLogin">
                            <div class="mb-3">
                                <label for="username" class="form-label">Número Documento de Identidad</label>
                                <input type="text" class="form-control" id="username" placeholder="Ingrese su DNI" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="password" placeholder="Ingrese su contraseña" name="password" required>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
