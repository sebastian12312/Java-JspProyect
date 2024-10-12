/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author angel
 */
public class conexion {
    
  

      public static Connection getConexion(){
        Connection con = null;       
        String cadena = "jdbc:mysql://localhost:3306/dbventas?user=root&password=";
        try{
            Class.forName("com.mysql.jdbc.Driver");            
            con = DriverManager.getConnection(cadena);                        
            System.out.println("Conexión Satisfactoria");
        }catch(Exception e){
            System.out.println("Error de conexión " + e);
        }               
        return con;
    }

 
}