package ar.edu.unq.ciu.GatoEncerradoDominio

import ar.edu.unq.ciu.minificados.RespuestaUsar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionAgarrar extends Accion {
	
	Item item

	new() {
		tipo = "agarrar"
	}

//	new(Accion unItem) {
//		//item = unItem
//	}
	
	override usarAccion() {

	}
	
	override usarAccion(Habitacion h) {
		h.acciones.add(this)
		this.usarAccion
	}
	
//	override getNombre() {
//		super.nombre + item.nombre
//	}
	
	override respuesta(Habitacion hab, UsuarioJugador u, Inventario i) {
		var resp = new RespuestaUsar
		resp.inv = i
		resp
	}

	// TODO a partir de aca lo nuevo
	def override ejecutar(Juego juego){
		super.ejecutar(juego)
		juego.itemNuevo(item)
	}

}