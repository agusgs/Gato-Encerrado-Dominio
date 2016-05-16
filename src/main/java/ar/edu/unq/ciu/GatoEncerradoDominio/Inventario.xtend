package ar.edu.unq.ciu.GatoEncerradoDominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Inventario {
	
	Integer id
	String nombre
	String descripcion
	List<Accion> items
	int maxCantidad
	
	new(){
		this.items = new ArrayList()
		this.maxCantidad = 15
	}
	
	def agregarItem(Accion i) {
		this.items.add(i)
	}
	
}