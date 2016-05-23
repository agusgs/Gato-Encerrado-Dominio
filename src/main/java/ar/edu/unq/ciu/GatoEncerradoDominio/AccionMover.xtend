package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionMover extends Accion{
	
	Habitacion habitacion

	new() {
		tipo = "mover"
		habitacion = new Habitacion
	}

	new(Habitacion unaHabitacion) {
		tipo = "mover"
		habitacion = unaHabitacion
	}
	
	override getNombre() {
		"Ir a " + habitacion.nombre
	}

	override usarAccion() {
		habitacion.setIsActual(true)
	}
	
	override usarAccion(Habitacion h) {
		h.setIsActual(false)
		h.acciones.remove(this)
		this.usarAccion
	}
	
}