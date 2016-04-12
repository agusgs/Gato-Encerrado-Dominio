package ar.edu.unq.ciu.GatoEncerradoAppModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion

@Observable
@Accessors
class MoverAppModel {
	List<Habitacion> habitaciones
	ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion habitacionActual
	ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion habitacionSeleccionada
	
	new(){
	}
	
	def agregarAccionMover(ar.edu.unq.ciu.GatoEncerradoDominio.Accion accionMover){
		habitacionActual.agregarAccion(accionMover)
	}
	
}
