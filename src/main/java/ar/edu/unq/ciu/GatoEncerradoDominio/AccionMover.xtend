package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionMover extends Accion{
	
	Habitacion habitacion

	new() {
	}

	new(Habitacion unaHabitacion) {
		habitacion = unaHabitacion
	}
	
	override getNombre() {
		"Ir a " + habitacion.nombre
	}

	override usarAccion() {
		habitacion.setIsActual(true)
	}
	
}