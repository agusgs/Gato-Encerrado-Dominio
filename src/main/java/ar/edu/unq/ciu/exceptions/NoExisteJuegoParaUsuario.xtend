package ar.edu.unq.ciu.exceptions

import org.omg.CORBA.UserException

class NoExisteJuegoParaUsuario extends UserException{

    new(Integer idUsuario){
        super("No existe juego para usuario id " + idUsuario.toString())
    }
}