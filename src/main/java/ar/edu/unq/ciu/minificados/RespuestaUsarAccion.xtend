package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RespuestaUsarAccion {
	String tipo
	InventarioMini inventario
	HabitacionMinificada habitacion
	
	new(){
		inventario = new InventarioMini
		habitacion = new HabitacionMinificada
	}
}