package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

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

}