<%-- 
    Document   : PeticionPaciente
    Created on : 1/10/2021, 9:53:50 p. m.
    Author     : andre
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Logica.Paciente"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarpaciente",
        "eliminarpaciente",
        "listarpaciente",
        "guardarpaciente"
    });
    
    String proceso = "" + request.getParameter("proceso");

    // Validaci?n de par?metros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardarpaciente")) {
            /*int ident = Integer.parseInt(request.getParameter("id"));*/
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String tipoDoc = request.getParameter("tipoDoc");
            String documento = request.getParameter("documento");
            String genero = request.getParameter("genero");            
            String telefono = request.getParameter("telefono");            
            String email = request.getParameter("email");
            /*boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));*/
            //su codigo ac?
            Paciente p = new Paciente();
            p.setNombres(nombres);
            p.setApellidos(apellidos);
            p.setTipoDoc(tipoDoc);
            p.setDocumento(documento);
            p.setGenero(genero);            
            p.setTelefono(telefono);
            p.setEmail(email);
            p.guardarPaciente();
            //fin de c?digo
            if (p.guardarPaciente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminarpaciente")) {
            String documento = request.getParameter("documento");
            //su codigo ac?
            Paciente p = new Paciente();
            p.getPaciente();
            p.setDocumento(documento);
            //Fin de c?digo
            if (p.borrarPaciente(documento)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listarpaciente")) {
            //su codigo ac?
            Paciente p = new Paciente();
            //Fin de c?digo
            try {
                List<Paciente> lista = p.listarPacientes();
                respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"Contactos\":[]";
                Logger.getLogger(Paciente.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.print(respuesta);
        } else if (proceso.equals("actualizarpaciente")) {
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String tipoDoc = request.getParameter("tipoDoc");
            String documento = request.getParameter("documento");
            String genero = request.getParameter("genero");            
            String telefono = request.getParameter("telefono");            
            String email = request.getParameter("email");
            //su codigo ac?
            Paciente p = new Paciente();
            p.setDocumento(documento);
            //Fin de c?digo
            if (p.actualizarPaciente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inv?lidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Usuario sin sesi?n.
    // Responder como objeto JSON codificaci?n ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
