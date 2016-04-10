package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionMover extends Accion{
	
	Habitacion habitacion
	
	new() {
	}
	
	new(Habitacion unaHabitacion) {
		habitacion = unaHabitacion
	}
	
	override usarAccion() {
		habitacion.setIsActual(true)
	}
	
}