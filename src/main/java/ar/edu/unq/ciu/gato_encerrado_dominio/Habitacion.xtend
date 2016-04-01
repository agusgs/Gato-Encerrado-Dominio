package ar.edu.unq.ciu.gato_encerrado_dominio


import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Habitacion {
	
	Boolean esInicial
	Boolean esFinal
	ArrayList<Accion> acciones
	ArrayList<AccionMover> movimientos
	
	new (){
		this.acciones = new ArrayList
		this.movimientos = new ArrayList
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