package ar.edu.unq.ciu.gato_encerrado_dominio

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Inventario {
	
	ArrayList<Accion> items
	int maxCantidad
	
	new(){
		this.items = new ArrayList()
		this.maxCantidad = 15
	}
	
	def agregarItem(Accion i) {
		this.items.add(i)
	}
	
}