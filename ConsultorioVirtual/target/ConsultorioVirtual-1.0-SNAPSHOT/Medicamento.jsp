<%-- 
    Document   : Medicamento
    Created on : 1/10/2021, 5:10:20 p. m.
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="Estilos.css" rel="stylesheet" type="text/css"/> <!--agregamos el archivo css Estilos.css-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicamento</title>
    </head>
    <body>
        <h1>Consultorio Virtual</h1>
        <div class="centro">
            <ul class="menuEnlaces"> <!--aplicamos el estilo "menuEnlaces" del archivo Estilos.css-->
                <li><a href="Index.jsp">Inicio</a></li>
                <li><a href="Paciente.jsp">Pacientes</a></li>
                <li><a href="">Citas</a></li>
                <li><a href="Medicamento.jsp">Medicamentos</a></li>                
            </ul>
        </div>
        <center><h2>Consultar Medicamentos</h2></center>  
        <table class="centrar"> <!-- Crear tabla -->
            <thead> <!-- encabezados de la tabla -->
                <th>Paciente</th>
                <th>Medicamento</th>
                <th>Cantidad</th>
            </thead>
            <tbody> <!-- cuerpo de la tabla -->
                <tr> <!-- Filas de la tabla -->
                    <td>Emilio</td> <!-- celdas de la fila -->
                    <td>Acetaminofen</td>
                    <td>30</td>
                </tr>
                <tr>
                    <td>Sandra</td>
                    <td>Dolex</td>
                    <td>20</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
