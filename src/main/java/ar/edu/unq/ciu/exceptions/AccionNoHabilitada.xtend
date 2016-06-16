package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class AccionNoHabilitada extends UserException{
    new(){
        super("Accion no habilitada en este momento")
    }
}