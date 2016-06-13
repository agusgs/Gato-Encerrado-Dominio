package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionAgarrar extends Accion {
	
	Item item

	new() { }

	new(Integer id, String nombre, Boolean habilitada, Item unItem) {
		item = unItem
        this.id = id
        this.nombre = nombre
        this.habilitada = habilitada
	}
	
	override usarAccion() {

	}
	
	override usarAccion(Habitacion h) {
		h.acciones.add(this)
		this.usarAccion
	}

	override respuesta(Habitacion hab, UsuarioJugador u, Inventario i) {
//		var resp = new RespuestaUsar
//		resp.inv = i
//		resp
	}

	// TODO a partir de aca lo nuevo
	def override ejecutar(Juego juego){
		super.ejecutar(juego)
		juego.itemNuevo(item)
	}

}