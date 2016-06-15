package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class NoExisteAccionParaHabitacion extends UserException {
	
	new(Integer idHabitacion, Integer idAccion){
		super("No existe la accion " + idAccion + " en la habitacion con id " + idHabitacion + "")
	}
}