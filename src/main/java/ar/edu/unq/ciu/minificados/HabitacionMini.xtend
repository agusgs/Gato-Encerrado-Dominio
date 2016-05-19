package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import java.util.List
import java.util.ArrayList

@Accessors
class HabitacionMini {
	
	Integer id
	String nombre
	Boolean isInicial
	Boolean isFinal
	List<Accion> acciones
	String pathImagen
	
	new(){
		acciones = new ArrayList
	}
	
	new(Integer idH, String n, String path){
		id = idH
		nombre = n
		acciones = new ArrayList
		isFinal = false
		isInicial = false
		pathImagen = path
	}
}