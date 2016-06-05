package ar.edu.unq.ciu.GatoEncerradoDominio

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
}