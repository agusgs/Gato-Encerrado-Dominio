package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RespuestaUsarAccion {
	String tipo
	InventarioMini inv
	HabitacionMini hab
	
	new(){
		inv = new InventarioMini
		hab = new HabitacionMini
	}
}