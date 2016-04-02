package ar.edu.unq.ciu.gato_encerrado_dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionAgarrar extends Accion {
	
	Item item
	
	new(Item unItem) {
		item = unItem
	}
	
}