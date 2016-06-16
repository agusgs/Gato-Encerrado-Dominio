package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RespuestaGanar extends Respuesta{

	String ganar

    new(){}
    
	new(String ganar){
        this.ganar = ganar
	}
}