package ar.edu.unq.ciu.GatoEncerradoAppModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion

@Observable
@Accessors
class MoverAppModel {
	List<Habitacion> habitaciones
	Habitacion habitacionActual
	Habitacion habitacionSeleccionada
	
	new(){
	}
	
	def agregarAccionMover(Accion accionMover){
		habitacionActual.agregarAccion(accionMover)
	}
	
}
