package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class NoExisteJuegoParaUsuario extends UserException{

    new(Integer idUsuario){
        super("No existe juego para usuario id " + idUsuario.toString())
    }
}