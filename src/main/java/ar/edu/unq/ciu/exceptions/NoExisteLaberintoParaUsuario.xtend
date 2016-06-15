package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class NoExisteLaberintoParaUsuario extends UserException {
	
	new(Integer idLab, Integer idUser){
		super("No existe el laberinto " + idLab + " para el usuario con id " + idUser + "")
		}
}