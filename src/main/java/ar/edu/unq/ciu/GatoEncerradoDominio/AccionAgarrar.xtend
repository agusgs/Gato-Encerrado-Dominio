package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionAgarrar extends Accion {
	
	Accion item

	new() {
	}

	new(Accion unItem) {
		item = unItem
	}
	
	override usarAccion() {

	}

}