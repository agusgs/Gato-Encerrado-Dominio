package ar.edu.unq.ciu.minificados

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RespuestaMover {
	Habitacion habitacion
	
	new(){
		habitacion = new Habitacion
	}
}