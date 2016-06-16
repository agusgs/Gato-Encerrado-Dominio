package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.minificados.RespuestaUsar

@Accessors
class ResultadoUsar extends Resultado{

    Accion accionHabilitada

    new(){}

    new(Accion accion){
        this.accionHabilitada = accion
    }

    def override getAccionHabilitada(){
        accionHabilitada
    }

    override minificate() {
        return new RespuestaUsar(accionHabilitada)
    }


}