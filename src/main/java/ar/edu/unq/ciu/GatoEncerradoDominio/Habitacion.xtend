package ar.edu.unq.ciu.GatoEncerradoDominio

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import static org.uqbar.commons.model.ObservableUtils.*
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class Habitacion {
	
	Integer id
	String nombre
	Boolean isInicial
	Boolean isFinal
	Boolean isActual
	List<Accion> acciones
	List<Item> items

	new(){
		acciones = new ArrayList<Accion>
        items = new ArrayList<Item>
		isFinal = false
		isInicial = false
		isActual = false 
	}
	
	new(String descripcion){
		nombre = descripcion
		acciones = new ArrayList
		isFinal = false
		isInicial = false
		isActual = false 
	}

	def setNombre(String nombreNuevo){
		if (nombreNuevo == "")
			throw new UserException("Debe completar el nombre de la Habitacion")

		this.nombre = nombreNuevo
		firePropertyChanged(this, "nombre", this.nombre)
	}

	def agregarAccion(Accion accion) {
		acciones.add(accion)		
		firePropertyChanged(this, "acciones", this.acciones)
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

	def quitarAccion(Accion unaAccion){
		acciones.remove(unaAccion)
	}
}