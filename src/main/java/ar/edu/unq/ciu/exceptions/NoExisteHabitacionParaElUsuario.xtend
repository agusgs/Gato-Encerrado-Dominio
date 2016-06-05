package ar.edu.unq.ciu.errores

import org.uqbar.commons.model.UserException

class NoExisteHabitacionParaElUsuario extends UserException {
	
	new(Integer idHabitacion, Integer idUsuario){
		super("No existe la habitacion " + idHabitacion + " para el usuario con id " + idUsuario + "")
		}
}