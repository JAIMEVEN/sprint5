/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import Persistencia.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author andre
 */
public class Paciente {
    private int id;
    private String tipoDoc;
    private String documento;
    private String nombres;
    private String apellidos;
    private String genero;
    private String telefono;
    private String email;

    public Paciente() {
    }

    public Paciente getPaciente(int id) throws SQLException {
        this.id = id;
        return this.getPaciente();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipoDoc() {
        return tipoDoc;
    }

    public void setTipoDoc(String tipoDoc) {
        this.tipoDoc = tipoDoc;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean guardarPaciente() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO paciente(tipoDoc, documento, nombres, apellidos, genero, telefono, email) "
                + " VALUES ( '" + this.tipoDoc + "','" + this.documento + "',"
                + "'" + this.nombres + "','" + this.apellidos + "','" + this.genero + "',"
                + "'" + this.telefono + "','" + this.email + "');  ";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean borrarPaciente(String documento) {
        String Sentencia = "DELETE FROM `paciente` WHERE `documento`='" + documento + "'";
        ConexionBD conexion = new ConexionBD();
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(Sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarPaciente() {
        ConexionBD conexion = new ConexionBD();
        String Sentencia = "UPDATE `paciente` SET tipoDoc='" + this.tipoDoc + "',documento='" + this.documento + "',nombres='" + this.nombres
                + "',apellidos='" + this.apellidos + "',genero='" + this.genero + "',telefono='" + this.telefono + "',email='" + this.email
                +  "' WHERE documento=" + this.documento + ";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(Sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public List<Paciente> listarPacientes() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<Paciente> listaPacientes = new ArrayList<>();
        String sql = "select * from paciente order by idpaciente asc";
        ResultSet rs = conexion.consultarBD(sql);
        Paciente p;
        while (rs.next()) {
            p = new Paciente();
            p.setId(rs.getInt("idpaciente"));
            p.setTipoDoc(rs.getString("tipoDoc"));
            p.setDocumento(rs.getString("documento"));
            p.setNombres(rs.getString("nombres"));
            p.setApellidos(rs.getString("apellidos"));
            p.setGenero(rs.getString("genero"));
            p.setTelefono(rs.getString("telefono"));
            p.setEmail(rs.getString("email"));
            listaPacientes.add(p);

        }
        conexion.cerrarConexion();
        return listaPacientes;
    }

    public Paciente getPaciente() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from paciente where documento='" + documento + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.id = rs.getInt("idpaciente");
            this.tipoDoc = rs.getString("tipoDoc");
            this.documento = rs.getString("documento");
            this.nombres = rs.getString("nombres");
            this.apellidos = rs.getString("apellidos");
            this.genero = rs.getString("genero");
            this.telefono = rs.getString("telefono");
            this.email = rs.getString("email");
            conexion.cerrarConexion();
            System.out.println(this.nombres);
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "Paciente{" + "id=" + id + ", tipoDoc=" + tipoDoc + ", documento=" + documento + ", nombres=" + nombres + ", apellidos=" + apellidos + ", genero=" + genero + ", telefono=" + telefono + ", email=" + email + '}';
    }
}
