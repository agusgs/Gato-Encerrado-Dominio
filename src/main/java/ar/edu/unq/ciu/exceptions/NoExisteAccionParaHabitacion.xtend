package ar.edu.unq.ciu.errores

import org.uqbar.commons.model.UserException

class NoExisteAccionParaHabitacion extends UserException {
	
	new(Integer idHabitacion, Integer idAccion){
		super("No existe la accion " + idAccion + " en la habitacion con id " + idHabitacion + "")
	}
}