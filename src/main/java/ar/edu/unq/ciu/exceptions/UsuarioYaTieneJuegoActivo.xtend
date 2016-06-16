package ar.edu.unq.ciu.exceptions

import org.omg.CORBA.UserException

class UsuarioYaTieneJuegoActivo extends UserException{
    new(){
        super("Termina el juego que tenes activo papa o abandonalo si sos cagon. Pero no podes tener mas de un juego activo")
    }
}