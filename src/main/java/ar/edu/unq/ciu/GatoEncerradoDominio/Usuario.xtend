package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import java.util.ArrayList
import java.util.List

@Accessors
@Observable
class Usuario {

	Integer id
    String nombre
    String password
    List<Laberinto> laberintos

    new(){
        laberintos = new ArrayList<Laberinto>()
    }

    def macheaCon(String nombreUsuario, String passwordUsuario){
        return (nombre == nombreUsuario) && (password == passwordUsuario)
    }
}