package ar.edu.unq.ciu.errores

import org.uqbar.commons.model.UserException

class NoExisteAccionParaHabitacion extends UserException {
	
	new(Integer idHab, Integer idAcc){
		super("No existe la accion " + idAcc + " en la habitacion con id " + idHab + "")
		}
}