package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {

    String nombre
    String password

    def macheaCon(String nombreUsuario, String passwordUsuario){
        return (nombre == nombreUsuario) && (password == passwordUsuario)
    }
}