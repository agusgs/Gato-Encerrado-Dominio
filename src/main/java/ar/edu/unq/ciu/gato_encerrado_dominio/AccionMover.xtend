package ar.edu.unq.ciu.gato_encerrado_dominio

import ar.edu.unq.ciu.gato_encerrado_dominio.Accion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionMover extends Accion {
	
	int indexSiguienteHabitacion
	
	new(int unaHabitacion) {
		this.indexSiguienteHabitacion = unaHabitacion
	}
	
}