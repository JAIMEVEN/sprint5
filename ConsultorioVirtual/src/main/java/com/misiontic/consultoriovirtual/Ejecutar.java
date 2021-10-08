/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.misiontic.consultoriovirtual;

import Logica.Paciente;
import java.sql.SQLException;

/**
 *
 * @author andre
 */
public class Ejecutar {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        // TODO code application logic here
        Paciente p = new Paciente();
        p.getPaciente();
    }
    
}
