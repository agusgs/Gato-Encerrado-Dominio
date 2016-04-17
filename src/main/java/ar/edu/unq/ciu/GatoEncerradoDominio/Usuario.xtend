package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List

@Accessors
class Usuario {

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