package ar.edu.unq.ciu.minificados

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RespuestaUsar extends Respuesta{
	Accion accion
	
	new(Accion accion){
		this.accion = accion
	}
}