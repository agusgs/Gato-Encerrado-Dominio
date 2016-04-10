package ar.edu.unq.ciu.GatoEncerradoDominio


import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Accessors
@Observable
class Habitacion {
	
	Boolean isInicial
	Boolean isFinal
	Boolean isActual
	List<Accion> acciones
	
	new (){
		acciones = new ArrayList
		isFinal = false
		isInicial = false
		isActual = false
	}
	
	def agregarAccion(Accion accion) {
		acciones.add(accion)
	}
	
	def usarAccionAgarrar(Accion accion){
		accion.usarAccion
		acciones.add(accion)
	}
	
	def usarAccionMover(Accion accion){
		setIsActual(false)
		accion.usarAccion
		acciones.remove(accion)
	}
	
	def usarAccionUsar(Accion accion){
		accion.usarAccion
		acciones.remove(accion)
	}
}