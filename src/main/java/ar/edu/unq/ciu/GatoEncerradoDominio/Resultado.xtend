package ar.edu.unq.ciu.GatoEncerradoDominio

import ar.edu.unq.ciu.minificados.Respuesta

abstract class Resultado {

    def Habitacion getHabitacionAMoverse(){
        throw new UnsupportedOperationException
    }

    def Item getItemAgarrado(){
        throw new UnsupportedOperationException
    }

    def Accion getAccionHabilitada(){
        throw new UnsupportedOperationException
    }

    def String ganar(){
        throw new UnsupportedOperationException
    }

    abstract def Respuesta minificate()
}