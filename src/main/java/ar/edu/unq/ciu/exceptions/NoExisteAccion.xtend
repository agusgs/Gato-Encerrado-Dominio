package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class NoExisteAccion extends UserException{

    new(){
        super("No existe accion")
    }
}