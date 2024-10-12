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
    <div class="sidebar" id="sidebar">
        <h4 class="text-center text-white py-3">Menú</h4>
        <a href="/ProyectoWeb/dashboard/administrador.jsp"><i class="fas fa-home me-2"></i> Inicio</a>
        <a href="../AdmUsuario"><i class="fas fa-exclamation-circle me-2"></i>  Clietens</a>

        <a href="/ProyectoWeb/dashboard/productos.jsp"><i class="fas fa-cogs me-2"></i> Productos</a>
        <a href="#"><i class="fas fa-exclamation-circle me-2"></i> Reclamos</a>
        <a href="${pageContext.request.contextPath}/ValidacionLogin" class="bg-danger">
            <i class="fas fa-sign-out-alt me-2"></i> Cerrar Sesión
        </a>
    </div>

    <div class="content" id="content">
        <div class="header">
            <button class="btn btn-outline-dark toggle-sidebar" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </button>
            <h2>Dashboard</h2>
            <div class="d-flex align-items-center">
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fas fa-user"></i> <%= usuario %>
                </a>
            </div>
        </div>

        <div class="container mt-4">
            <h3>Bienvenido al Dashboard</h3>
            <p>Aquí puedes gestionar tus datos y configuraciones.</p>

            <div class="container table-container" style="margin-top: 40px;">
                <h2 class="mb-4">Últimas Ventas</h2>
                <table class="table table-striped table-hover">
                    <thead class="table-primary">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Usuario</th>
                            <th>Cantidad</th>
                            <th>Subtotal</th>
                            <th>Total</th>
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
                            <td>S/ 270.00</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Producto B</td>
                            <td>Descripción del Producto B</td>
                            <td>Usuario2</td>
                            <td>5</td>
                            <td>S/ 50.00</td>
                            <td>S/ 250.00</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
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
