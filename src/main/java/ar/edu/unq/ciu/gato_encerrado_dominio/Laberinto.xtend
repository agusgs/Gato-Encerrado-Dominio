package ar.edu.unq.ciu.gato_encerrado_dominio

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Laberinto {
	
	String nombre
	ArrayList<Habitacion> habitaciones
	int indexHabitacionActual
	Inventario inventario
	
	new (String n){
		this.nombre = n
		this.habitaciones = new ArrayList()
		this.indexHabitacionActual = 0
		this.inventario = null
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
	 * PRE: la habitacion hacia donde nos movemos debe ser valida
	 */
	def void moverHabitacionActualA(int indexNuevaUbicacion) {
		var Habitacion hab = this.getHabitacion(indexHabitacionActual)
		if (hab.mePuedoMoverAHabitacion(indexNuevaUbicacion))
			indexHabitacionActual = indexNuevaUbicacion
		//else ..... DEFINIR SI DEBO CONTEMPLAR ESTA OPCIoN.... lanzar excepcion o que
	}
	
	def Habitacion getHabitacion(int index){
		this.habitaciones.get(index)
	}
	
	def comenzarJuego() {
		this.inventario = new Inventario()
	}
	
	def tomarItem(int indexHab) {
		var hab = getHabitacion(indexHab)
		if (!hab.acciones.isEmpty){
			var accion = hab.acciones.remove(0)
			//this.inventario.agregarItem(accion.getItem)
		}
			
	}
	
}