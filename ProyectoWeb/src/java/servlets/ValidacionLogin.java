/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.conexion; // Asegúrate de que la clase de conexión está en el paquete correcto
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author angel
 */
@WebServlet(name = "ValidacionLogin", urlPatterns = {"/ValidacionLogin"})
public class ValidacionLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession(false); // No crear una nueva sesión si no existe
    if (session != null) {
        session.invalidate(); // Cerrar la sesión
    }
    response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Validar que los campos no estén vacíos
    String sql = "SELECT * FROM usuario WHERE dni = ? AND contrasena = ?";
         try {
             Connection connection = conexion.getConexion();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
              preparedStatement.setString(1, username);
              preparedStatement.setString(2, password);
              ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                        HttpSession session = request.getSession();
                        session.setAttribute("usuario", username);
                        response.sendRedirect(request.getContextPath() + "/dashboard/administrador.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/index.jsp?error=Credenciales inválidas");
                    }
         } catch (Exception e) {
              response.sendRedirect(request.getContextPath() + "/index.jsp?error=Credenciales inválidas 2");
         }
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
