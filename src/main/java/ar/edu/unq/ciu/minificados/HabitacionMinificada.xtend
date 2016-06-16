package ar.edu.unq.ciu.minificados

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class HabitacionMinificada {
	
	Integer id
	String nombre
	Boolean isInicial
	Boolean isFinal
	List<AccionMinificada> acciones
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