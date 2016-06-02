package ar.edu.unq.ciu.minificados

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class LaberintoCompletoMinificado {
	
	Integer id
	String nombre
	List<HabitacionMini> habitaciones
	InventarioMini inventario
	
	new(){
		habitaciones = new ArrayList
		inventario = new InventarioMini
	}
	
	new (Integer idLab, String n){
		id = idLab
		nombre = n
		habitaciones = new ArrayList
		inventario = new InventarioMini
	}
}
