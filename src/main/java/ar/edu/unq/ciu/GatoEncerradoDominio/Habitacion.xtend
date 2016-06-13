package ar.edu.unq.ciu.GatoEncerradoDominio

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import static org.uqbar.commons.model.ObservableUtils.*
import org.uqbar.commons.model.UserException
import ar.edu.unq.ciu.errores.NoExisteAccion
import ar.edu.unq.ciu.exceptions.NoExisteItem

@Accessors
@Observable
class Habitacion {
	
	Integer id
	String nombre
	Boolean isInicial
	Boolean isFinal
	Boolean isActual
	String pathImagen
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
	
	def quitarAccion(Accion unaAccion){
		acciones.remove(unaAccion)
	}

	def accion(Integer idAccion){
		if(!(existeAccion(idAccion))){
			throw new NoExisteAccion
		}
        acciones.findFirst[accion | accion.id == idAccion]
	}

    def existeAccion(Integer idAccion){
        acciones.exists[accion | accion.id == idAccion]
    }

    def item(Integer idItem){
        if(!(existeItem(idItem))){
            throw new NoExisteItem
        }
        items.findFirst[item | item.id == idItem]
    }

    def existeItem(Integer idItem){
        items.exists[item | item.id == idItem]
    }
}