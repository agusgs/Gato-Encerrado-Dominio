package ar.edu.unq.ciu.errores

import org.uqbar.commons.model.UserException

class NoExisteAccion extends UserException{

    new(){
        super("No existe accion")
    }
}