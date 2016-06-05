package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class NoTieneItemParaAccion extends UserException{
    new(){
        super("Necesita un item para ejecutar esta accion")
    }
}