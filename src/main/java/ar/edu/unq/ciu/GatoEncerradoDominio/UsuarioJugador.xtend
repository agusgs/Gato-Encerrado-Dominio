package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioJugador {

    Integer id
    String nombre

    new(){
    }

    new(Integer id, String nombre){
        this.id = id
        this.nombre = nombre
    }

}