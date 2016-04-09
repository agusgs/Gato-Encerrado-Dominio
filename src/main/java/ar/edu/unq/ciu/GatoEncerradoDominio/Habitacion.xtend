package ar.edu.unq.ciu.GatoEncerradoDominio


import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Accessors
@Observable
class Habitacion {
	
	Boolean esInicial
	Boolean esFinal
	List<Accion> acciones
	List<AccionMover> movimientos
	
	new (){
		this.acciones = new ArrayList<Accion>
		this.movimientos = new ArrayList<AccionMover>
		this.esFinal = false
		this.esInicial = false
	}
	
	def agregarAccionMover(AccionMover accion) {
		this.movimientos.add(accion)
	}
	
	def agregarAccion(Accion accion) {
		this.acciones.add(accion)
	}
	
	def Boolean mePuedoMoverAHabitacion(int i) {
		/*
		this.movimientos.forEach[m|
			if m.indexSiguienteHabitacion.equals(i)
		]
		*/
		
		for (AccionMover am : movimientos) {
			if (am.indexSiguienteHabitacion.equals(i)){
				return true
			}
		}
		false
	}
	
	def void agregarPuenteA(int i) {
		this.movimientos.add(new AccionMover(i))
	}
	
}