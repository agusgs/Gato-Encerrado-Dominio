package ar.edu.unq.ciu.errores

import org.uqbar.commons.model.UserException

class NoExisteHabitacion extends UserException{
    new(){
        super('No existe la habitacion')
    }
}