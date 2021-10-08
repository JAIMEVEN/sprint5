<%-- 
    Document   : Proceso
    Created on : 1/10/2021, 9:37:22 p. m.
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Paciente</title>
    </head>
    <body>
        <%
   /*podemos leer los datos del request a una variable*/
   /*String edad=(String)request.getParameter("edad");
   String prefieres=(String)request.getParameter("preferencia");*/
   out.print("tu nombre es "+request.getParameter("nombres")+" "+request.getParameter("apellidos"));
   out.print("<br/>");
   out.print("tu documento es "+request.getParameter("tipoDoc")+" y su numero es "+request.getParameter("documento"));
   out.print("<br/>");
   out.print("tu género es "+request.getParameter("genero"));
   out.print("<br/>");
   out.print("tu numero de teléfono es "+request.getParameter("telefono")+" y su email es "+request.getParameter("email"));
   out.print("<br/>");
   /*podemos usar los datos directamente desde el request*/
   out.print("Bienvenido a Al Consultorio Virtual "+ request.getParameter("nombres").toString().toUpperCase());
 %>
    </body>
</html>
