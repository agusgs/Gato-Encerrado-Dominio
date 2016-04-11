package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException
import static org.uqbar.commons.model.ObservableUtils.*

import java.util.ArrayList
import java.util.List

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

    def setNombre(String nombreNuevo){
        if (nombreNuevo == "")
            throw new UserException("Debe completar el nombre del Laberinto")

        this.nombre = nombreNuevo
        firePropertyChanged(this, "nombre", this.nombre)
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
		for(Habitacion hab: habitaciones){if(hab.isActual)
				return hab	
		}
	}

    def cantidadDeHabitaciones(){
        return habitaciones.size
    }
}