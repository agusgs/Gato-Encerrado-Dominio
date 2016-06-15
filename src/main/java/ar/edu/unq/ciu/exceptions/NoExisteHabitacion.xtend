package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class NoExisteHabitacion extends UserException{
    new(){
        super('No existe la habitacion')
    }
}