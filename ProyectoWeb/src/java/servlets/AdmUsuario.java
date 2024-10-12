package servlets;

import clases.Usuario;
import db.conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet para administrar usuarios.
 */
@WebServlet(name = "AdmUsuario", urlPatterns = {"/AdmUsuario"})
public class AdmUsuario extends HttpServlet {




    /**
     * Procesa las solicitudes del cliente.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Maneja el método HTTP <code>GET</code>.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      HttpSession session = request.getSession();
try {
    String sql = "SELECT * FROM usuario"; // Asegúrate de que esta tabla existe
    
    Connection connection = conexion.getConexion();
    PreparedStatement preparedStatement = connection.prepareStatement(sql); // Usa la conexión existente
    ResultSet resultSet = preparedStatement.executeQuery();
    
    List<Usuario> usuarios = new ArrayList<>();
    while (resultSet.next()) {
        Usuario usuario = new Usuario();
        usuario.setId(resultSet.getInt("id"));
        usuario.setDni(resultSet.getString("dni"));
        usuario.setNombre(resultSet.getString("nombre"));
        usuario.setApellido(resultSet.getString("apellido"));
        usuario.setCorreo(resultSet.getString("correo"));
        usuario.setTelefono(resultSet.getString("telefono"));
        usuario.setContrasena(resultSet.getString("contrasena"));
        usuario.setGenero(resultSet.getInt("genero"));
        usuario.setEstado(resultSet.getInt("estado"));
        usuario.setRole(resultSet.getInt("role"));
        usuario.setFechaCreacion(resultSet.getString("fecha_creacion"));
        
        usuarios.add(usuario);
    }
    
    // Guarda la lista de usuarios en la sesión
    session.setAttribute("usuarios", usuarios);
    
    // Redirige a la vista de clientes
  RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/cliente.jsp");
dispatcher.forward(request, response);
} catch (Exception e) {
    e.printStackTrace(); // Maneja la excepción adecuadamente
    request.setAttribute("error", "Error al listar usuarios: " + e.getMessage());
    response.sendRedirect(request.getContextPath() + "/dashboard/cliente.jsp"); // Redirige a una página de error
}
    }

    /**
     * Maneja el método HTTP <code>POST</code>.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String contrasena = request.getParameter("contrasena");
        int genero = Integer.parseInt(request.getParameter("genero"));
        int role = 1;   // Por defecto, rol de usuario
        int estado = 1;// Asegúrate de manejar la conversión adecuadamente
        try {
            String sql = "INSERT INTO usuario (dni, nombre, apellido, correo, telefono, contrasena, genero, role, estado) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            Connection connection = conexion.getConexion();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            // Preparar la consulta
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, dni);
            preparedStatement.setString(2, nombre);
            preparedStatement.setString(3, apellido);
            preparedStatement.setString(4, correo);
            preparedStatement.setString(5, telefono);
            preparedStatement.setString(6, contrasena); // Recuerda aplicar hash a la contraseña antes de almacenarla
            preparedStatement.setInt(7, genero);
            preparedStatement.setInt(8, role);  // Asignar valor por defecto de rol
            preparedStatement.setInt(9, estado); // Asignar valor por defecto de estado
            int rowsInserted = preparedStatement.executeUpdate();
           RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/cliente.jsp");
dispatcher.forward(request, response);
        } catch (Exception e) {
           RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/cliente.jsp");
dispatcher.forward(request, response);
        }
    }

    /**
     * Devuelve una breve descripción del servlet.
     */
    @Override
    public String getServletInfo() {
        return "Servlet para administrar usuarios.";
    } // </editor-fold>
}
