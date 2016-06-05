package ar.edu.unq.ciu.appHelpers

import java.util.HashMap
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionGanar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar

class AccionFactory {

    HashMap<String, Object> accionHash

    def static para(HashMap<String, Object> accion){
        val factory = new AccionFactory()
        factory.accionHash = accion
        factory
    }

    def construir(){
        var accionConstruida = accion(accionHash.get('tipo').toString)

        accionConstruida.setId(Integer.parseInt(accionHash.get('id').toString))
        accionConstruida.setNombre(accionHash.get('nombre').toString)
        accionConstruida.setTipo(accionHash.get('tipo').toString)

        accionConstruida
    }

    def accion(String tipo){
        if(tipo == 'ganar'){
            return new AccionGanar
        }

        if(tipo == 'agarrar'){
            return new AccionAgarrar
        }

        if(tipo == 'mover'){
            return new AccionMover
        }

        if(tipo == 'usar'){
            return new AccionUsar
        }
    }
}