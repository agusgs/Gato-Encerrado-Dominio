package ar.edu.unq.ciu.minificados

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class LaberintoCompletoMinificado {
	
	Integer id
	String nombre
	List<HabitacionMinificada> habitacionesMinificadas

	new(){
		habitacionesMinificadas = new ArrayList
	}
}
