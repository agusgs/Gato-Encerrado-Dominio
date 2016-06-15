package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class NoExisteHabitacionParaElUsuario extends UserException {
	
	new(Integer idHabitacion, Integer idUsuario){
		super("No existe la habitacion " + idHabitacion + " para el usuario con id " + idUsuario + "")
		}
}