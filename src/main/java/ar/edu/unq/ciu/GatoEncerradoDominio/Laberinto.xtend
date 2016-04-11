package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Laberinto {
	
	String nombre
	List<Habitacion> habitaciones
	Inventario inventario

    new(){
        this.habitaciones = new ArrayList<Habitacion>()
        this.inventario = null
    }
	new (String n){
		this.nombre = n
		this.habitaciones = new ArrayList()
		this.inventario = null
	}
	
	def agregarHabitacion(Habitacion unaHabitacion) {
		this.habitaciones.add(unaHabitacion)
	}

	def quitarHabitacion(Habitacion unaHabitacion) {
		this.habitaciones.remove(unaHabitacion)
	}
			
	def Habitacion getHabitacionInicial(){
		for(Habitacion hab: habitaciones){
			if(hab.isInicial)
				return hab	
		}
	}

	def comenzarJuego() {
		this.inventario = new Inventario()
		getHabitacionInicial.setIsActual(true)
	}
	
	def Habitacion getHabitacionActual(){
		for(Habitacion hab: habitaciones){
			if(hab.isActual)
				return hab	
		}
	}
	
}