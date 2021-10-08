<%-- 
    Document   : Paciente
    Created on : 1/10/2021, 5:12:59 p. m.
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="Estilos.css" rel="stylesheet" type="text/css"/> <!--agregamos el archivo css Estilos.css-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paciente</title>
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
        <br/>
        <center><h2>Registro de Paciente</h2></center>         
        <form class="form" action="Proceso.jsp" method="post">
            Nombres:
            <input type="text" name="nombres"> 
            <br/>
            Apellidos:
            <input type="text" name="apellidos">
            <br/>
            Tipo de Documento:
            <select name="tipoDoc">
                <option value="seleccione" selected>Seleccione
              <option value="RC">RC
              <option value="TI">TI
              <option value="CC">CC
              <option value="CE">CE
              <option value="PT">PT              
            </select>   
            <br/>
            Documento
            <input type="text" name="documento">
            <br/>                
            Teléfono
            <input type="text" name="telefono">
            <br/>
            Email
            <input type="text" name="email">
            <br/>
            Género  
            <br/>
            Femenino<input type="Radio" name="genero" value= "Femenino">            
            Masculino<input type="Radio" name= "genero"value="Masculino">      
            <br/>
            <p><input type="submit" value="Enviar"></p>
        </form>
    </body>
</html>
