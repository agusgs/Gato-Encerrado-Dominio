package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionUsar extends Accion{

	Accion item

	new(){
	}

	new(Accion unItem) {
		item = unItem
	}

	override usarAccion() {
		item.usarAccion
	}


}