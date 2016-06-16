package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionMover extends Accion{
	
	Habitacion habitacion

	new() { }

	new(Habitacion unaHabitacion) {
		habitacion = unaHabitacion
	}

    def override ejecutar(Juego juego){
        super.ejecutar(juego)
		juego.pasarAHabitacion(habitacion)
	}
}