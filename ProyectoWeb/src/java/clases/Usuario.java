/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import java.sql.Timestamp;

public class Usuario {
    private int id;                // ID autoincrementable
    private String dni;           // DNI del usuario
    private String nombre;        // Nombre del usuario
    private String apellido;      // Apellido del usuario
    private String correo;        // Correo electrónico
    private String telefono;      // Teléfono del usuario
    private String contrasena;    // Contraseña del usuario
    private int genero;           // Género del usuario
    private int estado;           // Estado del usuario
    private int role;             // Rol del usuario
    private String fechaCreacion; // Fecha de creación

    public Usuario() {
    }

    public Usuario(int id, String dni, String nombre, String apellido, String correo, String telefono, String contrasena, int genero, int estado, int role, String fechaCreacion) {
        this.id = id;
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.telefono = telefono;
        this.contrasena = contrasena;
        this.genero = genero;
        this.estado = estado;
        this.role = role;
        this.fechaCreacion = fechaCreacion;
    }




    // No setter para fechaCreacion, ya que debe ser establecida al momento de la creación

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getGenero() {
        return genero;
    }

    public void setGenero(int genero) {
        this.genero = genero;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}