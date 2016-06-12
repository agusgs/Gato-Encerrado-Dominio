package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ResultadoGanar extends Resultado{

    String ganaste

    new(){
        ganaste = "Ganaste"
    }
    def override ganar(){
        ganaste
    }
}