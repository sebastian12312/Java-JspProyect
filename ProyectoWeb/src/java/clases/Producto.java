package clases; // Cambia el paquete según tu estructura

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Producto {
    private int id_producto;
    private String nombre;
    private String descripcion;
    private int stock;
    private BigDecimal precio;
    private String estado; // "activo" o "inactivo"
    private Timestamp fecha_creacion; // Fecha de creación
    private String genero; // "masculino", "femenino" o "unisex"
    private String url_imagen;

    // Constructor
    public Producto(int id_producto, String nombre, String descripcion, int stock, BigDecimal precio, 
                    String estado, Timestamp fecha_creacion, String genero, String url_imagen) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.stock = stock;
        this.precio = precio;
        this.estado = estado;
        this.fecha_creacion = fecha_creacion;
        this.genero = genero;
        this.url_imagen = url_imagen;
    }

    // Getters y Setters
    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Timestamp getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(Timestamp fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getUrl_imagen() {
        return url_imagen;
    }

    public void setUrl_imagen(String url_imagen) {
        this.url_imagen = url_imagen;
    }
}
