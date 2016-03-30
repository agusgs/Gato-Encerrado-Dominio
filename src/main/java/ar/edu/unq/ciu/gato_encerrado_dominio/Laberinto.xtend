package ar.edu.unq.ciu.gato_encerrado_dominio

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Laberinto {
	
	String nombre
	ArrayList<Habitacion> habitaciones
	int indexHabitacionActual
	
	new (String n){
		this.nombre = n
		this.habitaciones = new ArrayList()
		this.indexHabitacionActual = 0
	}
	
	def agregarHabitacion(Habitacion unaHabitacion) {
		this.habitaciones.add(unaHabitacion)
	}
	
	def quitarHabitacion(Habitacion unaHabitacion) {
		this.habitaciones.remove(unaHabitacion)
	}
	
	def int posicionActual() {
		indexHabitacionActual
	}
	
	/**
	 * PRE: la habitaci�n hacia donde nos movemos debe ser valida
	 */
	def void moverHabitacionActualA(int indexNuevaUbicacion) {
		var Habitacion hab = this.getHabitacion(indexHabitacionActual)
		if (hab.mePuedoMoverAHabitacion(indexNuevaUbicacion))
			indexHabitacionActual = indexNuevaUbicacion
		//else ..... DEFINIR SI DEBO CONTEMPLAR ESTA OPCI�N.... lanzar excepci�n o que
	}
	
	def Habitacion getHabitacion(int index){
		this.habitaciones.get(index)
	}
	
}