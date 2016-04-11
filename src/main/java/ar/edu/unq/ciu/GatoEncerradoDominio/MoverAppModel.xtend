package ar.edu.unq.ciu.GatoEncerradoDominio

import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class MoverAppModel {
	ArrayList<Habitacion> habitaciones
	Habitacion habitacionActual
	Habitacion habitacionSeleccionada
	
	new(ArrayList<Habitacion> habitaciones, Habitacion habitacion){
		this.habitaciones = habitaciones
		habitacionActual = habitacion
		habitacionSeleccionada= habitaciones.get(0)
		
	}
	
	def agregarAccionMover(Accion accionMover){
		habitacionActual.agregarAccion(accionMover)
	}
	
}