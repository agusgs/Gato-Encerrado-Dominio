package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.GatoEncerradoDominio.Inventario
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion

@Accessors
class RespuestaAgarrar {
	//String tipo
	Inventario inv
	Habitacion hab
	
	new(){
		inv = new Inventario
		hab = new Habitacion
	}
}