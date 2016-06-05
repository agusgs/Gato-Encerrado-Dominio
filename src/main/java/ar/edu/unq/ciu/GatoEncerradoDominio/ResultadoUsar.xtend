package ar.edu.unq.ciu.GatoEncerradoDominio

class ResultadoUsar extends Resultado{

    Accion accionHabilitada

    new(Accion accion){
        this.accionHabilitada = accion
    }

    def override getAccionHabilitada(){
        accionHabilitada
    }

}