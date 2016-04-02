package ar.edu.unq.ciu.gato_encerrado_dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionMover{
	
	int indexSiguienteHabitacion
	
	new(int unaHabitacion) {
		this.indexSiguienteHabitacion = unaHabitacion
	}
	
}