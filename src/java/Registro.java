/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hennr
 */
@WebServlet(urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtiene los parámetros de la solicitud
            int id = Integer.parseInt(request.getParameter("idlibro"));
            String titulo = request.getParameter("titulo_libro");
            int año = Integer.parseInt(request.getParameter("anio_publicado"));
            String autor = request.getParameter("autor");
            String clasificacion = request.getParameter("clasificacion");
            int cantidadHojas = Integer.parseInt(request.getParameter("cantidad_paginas"));
            int tipoPasta = Integer.parseInt(request.getParameter("tipo_pastas_id_tipo_pastas"));
            
            // Llama al método para guardar el registro
            guardarLibro(id, titulo, año, autor, clasificacion, cantidadHojas, tipoPasta);
            response.getWriter().write("Libro guardado exitosamente.");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error al guardar el libro en la base de datos.");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void guardarLibro(int id, String titulo, int año, String autor, String clasificacion, int cantidadHojas, int tipoPasta) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/base_datos_final";
        String user = "root";
        String password = "Enty";

        // Establece la conexión y prepara la sentencia
        Connection conn = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = conn.prepareStatement("INSERT INTO libro (idlibro, titulo_libro, anio_publicado, autor, clasificacion, cantidad_paginas, tipo_pastas_id_tipo_pastas) VALUES (?, ?, ?, ?, ?, ?, ?)");

        // Asigna los valores de los parámetros a la sentencia
        stmt.setInt(1, id);
        stmt.setString(2, titulo);
        stmt.setInt(3, año);
        stmt.setString(4, autor);
        stmt.setString(5, clasificacion);
        stmt.setInt(6, cantidadHojas);
        stmt.setInt(7, tipoPasta);

        // Ejecuta la actualización en la base de datos
        stmt.executeUpdate();

        // Cierra los recursos
        stmt.close();
        conn.close();
    }
}

