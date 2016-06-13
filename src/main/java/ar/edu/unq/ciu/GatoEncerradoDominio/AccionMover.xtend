package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.ciu.minificados.RespuestaMover

@Accessors
@Observable
class AccionMover extends Accion{
	
	Habitacion habitacion

	new() {
		habitacion = new Habitacion
	}

	new(Habitacion unaHabitacion) {
		habitacion = unaHabitacion
	}

	override usarAccion() {
		habitacion.setIsActual(true)
	}
	
	override usarAccion(Habitacion h) {
		h.setIsActual(false)
		h.acciones.remove(this)
		this.usarAccion
	}
	
	override respuesta(Habitacion hab, UsuarioJugador us, Inventario inv) {
		var resp = new RespuestaMover
		resp.habitacion = habitacion
		resp
	}

	//TODO a partir de aca lo nuevo
    def override ejecutar(Juego juego){
        super.ejecutar(juego)
		juego.pasarAHabitacion(habitacion)
	}
}