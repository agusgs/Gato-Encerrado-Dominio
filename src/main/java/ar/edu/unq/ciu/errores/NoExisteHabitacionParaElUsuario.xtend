package ar.edu.unq.ciu.errores

import org.uqbar.commons.model.UserException

class NoExisteHabitacionParaElUsuario extends UserException {
	
	new(Integer idHab, Integer idUser){
		super("No existe la habitacion " + idHab + " para el usuario con id " + idUser + "")
		}
}