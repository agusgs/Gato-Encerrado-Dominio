package ar.edu.unq.ciu.minificados

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RespuestaMover extends Respuesta{
	Habitacion habitacion

    new(){ }

	new(Habitacion habitacion){
		this.habitacion = habitacion
	}
}