package ar.edu.unq.ciu.minificados

import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RespuestaAgarrar extends Respuesta{

	Item item

	new(){}

	new(Item item){
		this.item = item
	}
}