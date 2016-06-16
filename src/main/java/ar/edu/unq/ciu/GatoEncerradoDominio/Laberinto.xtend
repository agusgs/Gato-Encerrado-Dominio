package ar.edu.unq.ciu.GatoEncerradoDominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

import static org.uqbar.commons.model.ObservableUtils.*
import ar.edu.unq.ciu.exceptions.NoExisteHabitacion

@Accessors
@Observable
class Laberinto {

	Integer id
	String nombre
	List<Habitacion> habitaciones
	Inventario inventario
	String pathImagen
	String descripcion

    new(){
        this.habitaciones = new ArrayList<Habitacion>()
        this.inventario = null
    }
	new (String n){
		this.nombre = n
		this.habitaciones = new ArrayList()
		this.inventario = null
	}

	new (Integer id, String nombre, String pathImagen, String descripcion){
        this.id = id
		this.nombre = nombre
		this.habitaciones = new ArrayList()
		this.inventario = null
		this.pathImagen = pathImagen
		this.descripcion = descripcion
	}

    def setNombre(String nombreNuevo){
        if (nombreNuevo == "")
            throw new UserException("Debe completar el nombre del Laberinto")

        this.nombre = nombreNuevo
        firePropertyChanged(this, "nombre", this.nombre)
    }

	def habitacion(Integer idHabitacion){
		if(!(existeHabitacion(idHabitacion))){
			throw new NoExisteHabitacion
		}
		habitaciones.findFirst[habitacion | habitacion.id == idHabitacion]
	}

	def existeHabitacion(Integer idHabiacion){
		habitaciones.exists[habitacion | habitacion.id == idHabiacion]
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

	def tieneHabitacion(Habitacion unaHabitacion){
		return habitaciones.contains(unaHabitacion)
	}
}