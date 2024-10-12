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
                    <h3  class="mt-auto mb-auto">Dashboard/</h3><span class="mt-auto mb-auto">productos</span> 
                </div>
                <div class="d-flex align-items-center">
                      <i class="fas fa-user"></i> <%= usuario %>
                </div>
            </div>

            <!-- Contenido -->
            <div class="container mt-4">               

                <div class="container table-container" style="margin-top: 40px;">
                    <h2 class="mb-4">Lista Producto</h2>
                      <a href="#" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
                       Agregar Item
                    </a>
                    <table class="table table-striped table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Usuario</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Producto A</td>
                                <td>Descripción del Producto A</td>
                                <td>Usuario1</td>
                                <td>3</td>
                                <td>S/ 90.00</td>
                                <td>
                                    <a href="#" class="border text-white bg-success rounded" style="padding: 5px">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                        </svg>
                                    </a>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
