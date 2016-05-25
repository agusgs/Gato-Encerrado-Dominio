package ar.edu.unq.ciu.GatoEncerradoDominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class AccionGanar extends Accion {
	
	new(){
		tipo = "ganar"
	}
	
	override usarAccion() {
	}
	
	override usarAccion(Habitacion hab) {
	}
	
}