package ar.edu.unq.ciu.GatoEncerradoAppModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import org.uqbar.commons.model.UserException

@Observable
@Accessors
class MoverAppModel {
	List<Habitacion> habitaciones
	Habitacion habitacionActual
	Habitacion habitacionSeleccionada
	
	new(){
	}
	
	def agregarAccionMover(Accion accionMover){
		
		validacionSeleccionadaDistintaALaActual()
		habitacionActual.agregarAccion(accionMover)
	}
	
	def validacionSeleccionadaDistintaALaActual(){
		val mensajeDeExcepcion = "No es posible moverte en la misma habitaciòn en la que te encontras."
        if(habitacionActual.equals(habitacionSeleccionada))
        	throw new UserException(mensajeDeExcepcion)
	}
	
}
