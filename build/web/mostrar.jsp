<%-- 
    Document   : mostrar
    Created on : 9/11/2024, 7:43:33 a. m.
    Author     : hennr
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar libros</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a href="index.jsp">Regresar</a>
            </div>
        </nav>

        <%

            String url = "jdbc:mysql://localhost:3306/base_datos_final";
            String user = "root";
            String password = "Enty";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            PreparedStatement ps;
            ResultSet rs;
            ps = con.prepareStatement("SELECT * FROM libro");
            rs = ps.executeQuery();

        %>

        <div class="container mt-5">
            <h1 class="text-center mb-4">REGISTROS</h1>

            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Titulo</th>
                            <th scope="col">Año Publicado</th>
                            <th scope="col">Autor</th>
                            <th scope="col">Clasificación</th>
                            <th scope="col">Cantidad de Paginas</th>
                            <th scope="col">Tipo de pasta</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rs.next()) {%>
                        <tr>
                            <td><%= rs.getInt("idlibro")%></td>
                            <td><%= rs.getString("titulo_libro")%></td>
                            <td><%= rs.getInt("anio_publicado")%></td>
                            <td><%= rs.getString("autor")%></td>
                            <td><%= rs.getString("clasificacion")%></td>
                            <td><%= rs.getInt("cantidad_paginas")%></td>

                            <%
                                int tipo = rs.getInt("tipo_pastas_id_tipo_pastas");
                                String tipoPasta;
                                if (tipo == 1) {
                                    tipoPasta = "Pasta Dura";
                                } else {
                                    tipoPasta = "Pasta Blanda";
                                }
                            %>

                            <td><%= tipoPasta%></td>
                        </tr>
                        <% }%>

                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
