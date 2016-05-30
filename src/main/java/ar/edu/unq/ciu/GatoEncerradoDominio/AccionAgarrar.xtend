package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.ciu.minificados.RespuestaUsar

@Accessors
@Observable
class AccionAgarrar extends Accion {
	
	Item item

	new() {
		tipo = "agarrar"
	}

	new(Accion unItem) {
		//item = unItem
	}
	
	override usarAccion() {

	}
	
	override usarAccion(Habitacion h) {
		h.acciones.add(this)
		this.usarAccion
	}
	
	override getNombre() {
		super.nombre + item.nombre
	}
	
	override respuesta(Habitacion hab, UsuarioJugador u, Inventario i) {
		var resp = new RespuestaUsar
		resp.inv = i
		resp
	}

}