<%-- 
    Document   : registro
    Created on : 9/11/2024, 7:43:24 a. m.
    Author     : hennr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>


        <h2 class="text-center mb-4">Formulario de Registro</h2>

        <form action="Registro" method="post" class="p-4 border rounded bg-light">
            <div class="mb-3">
                <label for="idlibro" class="form-label">ID</label>
                <input type="number" id="idlibro" name="idlibro" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="titulo_libro" class="form-label">Titulo</label>
                <input type="text" id="titulo_libro" name="titulo_libro" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="anio_publicado" class="form-label">Año Publicado</label>
                <input type="number" id="anio_publicado" name="anio_publicado" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="autor" class="form-label">Autor</label>
                <input type="text" id="autor" name="autor" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="clasificacion" class="form-label">Clasificación</label>
                <input type="text" id="clasificacion" name="clasificacion" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="cantidad_paginas" class="form-label">Cantidad de Paginas</label>
                <input type="number" id="cantidad_paginas" name="cantidad_paginas" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="tipo_pastas_id_tipo_pastas" class="form-label">Tipo de pasta</label>
                <select id="tipo_pastas_id_tipo_pastas" name="tipo_pastas_id_tipo_pastas" class="form-control" required>
                    <option value="1">Pasta dura</option>
                    <option value="2">Pasta blanda</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Registrar</button>
        </form>







    </body>
</html>
