<!-- Ejemplo de consulta, incluye el programa de conexi�n a la base de datos, y ejecuta una consulta sobre
     la base de datos y muestra sus resultados en columna nombre y apellidos 
   direccion donde va este archivo: C:\xampp\htdocs\nuevacarpeta-->

<?php
   $conexion = new mysqli('localhost','root','','consultorio');
   if ($conexion->connect_errno) 
   {
      echo "Error conectando a la base de datos.<br>";
	  echo "Error tipo: " . $conexion->connect_errno . "<br>";
      exit;
   }
   $consulta="SELECT * from paciente";
   if (!$resultado = $conexion->query($consulta)) {
       echo "Lo sentimos, no se pudo realizar la consulta.";
       exit;
   }
   echo"Prueba de conectividad a base de datos y acceso a una tabla";
   echo"<TABLE BORDER=1 CELLSPACING=1 CELLPADDING=1><TR><TD>Id Paciente</TD><TD>Tipo Documento</TD><TD>Documento Paciente</TD><TD>Nombre Paciente</TD><TD>Apellidos Paciente</TD><TD>Genero Paciente</TD><TD>Teléfono Paciente</TD><TD>Email Paciente</TD></TR>";
   while($row = $resultado->fetch_assoc()) {
      echo "<tr><td>".$row['idpaciente']."</td><td>".$row['tipoDoc']."</td><td>".$row['documento']."</td><td>".$row['nombres']."</td><td>".$row['apellidos']."</td><td>".$row['genero']."</td><td>".$row['telefono']."</td><td>".$row['email']."</td></tr>";
   }
   echo "</table>";
   $resultado->free();
   $conexion->close();
?>
