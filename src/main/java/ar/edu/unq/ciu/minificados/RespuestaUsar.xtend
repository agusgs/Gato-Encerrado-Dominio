package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.GatoEncerradoDominio.Inventario

@Accessors
class RespuestaUsar {
	Inventario inv
	
	new(){
		inv = new Inventario
	}
}