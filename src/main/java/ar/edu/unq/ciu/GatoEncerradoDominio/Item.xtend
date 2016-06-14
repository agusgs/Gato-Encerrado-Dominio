package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Item {
	Integer id
	String nombre
	String pathImagen
	
	new() {	}

	new(Integer id, String nombre, String pathImagen){
        this.id = id
        this.nombre = nombre
		this.pathImagen = pathImagen
    }
}