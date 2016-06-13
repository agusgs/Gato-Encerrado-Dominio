package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.minificados.RespuestaGanar

@Accessors
class ResultadoGanar extends Resultado{

    String ganaste

    new(){
        ganaste = "Ganaste"
    }
    def override ganar(){
        ganaste
    }

    override minificate() {
        return new RespuestaGanar(ganaste)
    }

}