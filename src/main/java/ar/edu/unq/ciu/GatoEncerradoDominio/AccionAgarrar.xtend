package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionAgarrar extends Accion {
	
	Item item
	String nombre

	new() {
	}

	new(Accion unItem) {
		//item = unItem
	}
	
	override usarAccion() {

	}

}