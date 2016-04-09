package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionMover extends Accion{
	
	int indexSiguienteHabitacion

	new(){
	}

	new(int unaHabitacion) {
		this.indexSiguienteHabitacion = unaHabitacion
	}
	
}