package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Laberinto {
	
	String nombre
	ArrayList<Habitacion> habitaciones
	int indexHabitacionActual
	Inventario inventario

    new(){
        this.habitaciones = new ArrayList()
        this.indexHabitacionActual = 0
        this.inventario = null
    }
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
	 * PARAM: indexNuevaUbicacion numero de la habitacion a la que se quiere avanzar
	 */
	
	def void moverHabitacionActualA(int indexNuevaUbicacion) {
		/*
		var Habitacion hab = this.getHabitacion(posicionActual())
		if (hab.mePuedoMoverAHabitacion(indexNuevaUbicacion))
			indexHabitacionActual = indexNuevaUbicacion
		//else ..... DEFINIR SI DEBO CONTEMPLAR ESTA OPCIoN.... lanzar excepcion o que
		*/
	}
	
	def Habitacion getHabitacion(int index){
		this.habitaciones.get(index)
	}
	
	def comenzarJuego() {
		this.inventario = new Inventario()
	}
	
	/**
	 * Se quita el elemento de la habitacion y se agrega al inventario
	 */
	def tomarItem(Habitacion hab) {
		if (!hab.acciones.isEmpty){
			var Accion accion = hab.acciones.remove(0)
			this.inventario.agregarItem(accion)
		}
			
	}
	
	def Habitacion getHabitacionActual(){
		this.getHabitacion(this.posicionActual)
	}
	
}