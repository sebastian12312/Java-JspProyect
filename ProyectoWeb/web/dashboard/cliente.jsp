<%@page import="clases.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <style>
            body {
                display: flex;
                min-height: 100vh;
            }

            .sidebar {
                width: 250px;
                background-color: #343a40;
                position: fixed;
                top: 0;
                left: 0;
                height: 100vh;
                transition: all 0.3s;
            }

            .sidebar a {
                color: white;
                text-decoration: none;
                padding: 15px;
                display: block;
            }

            .sidebar a:hover {
                background-color: #495057;
            }

            .content {
                margin-left: 250px;
                padding: 20px;
                width: 100%;
                transition: margin-left 0.3s;
            }

            .header {
                background-color: #f8f9fa;
                padding: 10px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #dee2e6;
            }

            .toggle-sidebar {
                display: none;
            }

            @media (max-width: 768px) {
                .sidebar {
                    left: -250px;
                }

                .content {
                    margin-left: 0;
                }

                .toggle-sidebar {
                    display: block;
                }

                .sidebar.active {
                    left: 0;
                }

                .content.active {
                    margin-left: 250px;
                }
            }
        </style>
    </head>
    <%
        String usuario = (String) session.getAttribute("usuario");
        if (usuario != null && !usuario.trim().isEmpty()) {
    %>


    <body>

        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <h4 class="text-center text-white py-3">Menú</h4>
            <a href="/ProyectoWeb/dashboard/administrador.jsp"><i class="fas fa-home me-2"></i> Inicio</a>
            <a href="/ProyectoWeb/dashboard/cliente.jsp"><i class="fas fa-user me-2"></i> Clientes</a>
            <a href="/ProyectoWeb/dashboard/productos.jsp"><i class="fas fa-cogs me-2"></i> Productos</a>
            <a href="#"><i class="fas fa-exclamation-circle me-2"></i> Reclamos</a>
            <a href="#" class="bg-danger"><i class="fas fa-sign-out-alt me-2"></i> Cerrar Sesión</a>
        </div>

        <!-- Contenido Principal -->
        <div class="content" id="content">
            <!-- Header -->
            <div class="header">
                <button class="btn btn-outline-dark toggle-sidebar" id="sidebarToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="d-flex">
                    <h3  class="mt-auto mb-auto">Dashboard/</h3><span class="mt-auto mb-auto">cliente</span> 
                </div>
                <div class="d-flex align-items-center">
                    <i class="fas fa-user"></i> <%= usuario%>
                </div>
            </div>

            <!-- Contenido -->
            <div class="container mt-4">               

                <div class="container table-container" style="margin-top: 40px;">
                    <h2 class="mb-4">Lista cliente</h2>
                    <a href="#" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Agregar Item
                    </a>
                    <div class="container mt-4">

                        <table class="table table-striped">
                            <thead class="table-primary">
                                <tr>
                                    <th>ID</th>
                                    <th>DNI</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Correo</th>
                                    <th>Teléfono</th>
                                    <th>Género</th>
                                    <th>Estado</th>
                                    <th>Rol</th>
                                    <th>Acciones

                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Usuario> usuarios = (List<Usuario>) session.getAttribute("usuarios");
                                    if (usuarios != null && !usuarios.isEmpty()) {
                                        for (Usuario usuario1 : usuarios) {
                                %>
                                <tr>
                                    <td><%= usuario1.getId()%></td>
                                    <td><%= usuario1.getDni()%></td>
                                    <td><%= usuario1.getNombre()%></td>
                                    <td><%= usuario1.getApellido()%></td>
                                    <td><%= usuario1.getCorreo()%></td>
                                    <td><%= usuario1.getTelefono()%></td>
                                    <td><%= usuario1.getGenero()%></td>
                                    <td><%= usuario1.getEstado()%></td>
                                    <td><%= usuario1.getRole()%></td>
                                    <td>
                                        <a href="#" class="btn btn-warning btn-sm">Editar</a>
                                        <a href="#" class="btn btn-danger btn-sm">Eliminar</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="10" class="text-center">No hay usuarios registrados.</td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registrar Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="registroForm" action="AdmUsuario" method="POST">
                            <div class="mb-3">
                                <label for="dni" class="form-label">DNI</label>
                                <input type="text" class="form-control" id="dni" name="dni" required>
                            </div>
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" required>
                            </div>
                            <div class="mb-3">
                                <label for="apellido" class="form-label">Apellido</label>
                                <input type="text" class="form-control" id="apellido" name="apellido" required>
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Correo</label>
                                <input type="email" class="form-control" id="correo" name="correo" required>
                            </div>
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="text" class="form-control" id="telefono" name="telefono" required>
                            </div>
                            <div class="mb-3">
                                <label for="contrasena" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                            </div>
                            <div class="mb-3">
                                <label for="genero" class="form-label">Género</label>
                                <select class="form-select" id="genero" name="genero" required>
                                    <option value="1">Masculino</option>
                                    <option value="2">Femenino</option>
                                    <option value="3">Otro</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Registrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Toggle Sidebar
            const sidebarToggle = document.getElementById('sidebarToggle');
            const sidebar = document.getElementById('sidebar');
            const content = document.getElementById('content');

            sidebarToggle.addEventListener('click', () => {
                sidebar.classList.toggle('active');
                content.classList.toggle('active');
            });
        </script>
    </body>
    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    %>
</html>
