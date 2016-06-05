package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class NoExisteItem extends UserException{
    new(){
        super("No existe el item")
    }
}