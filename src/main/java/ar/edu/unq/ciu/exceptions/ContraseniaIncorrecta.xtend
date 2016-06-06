package ar.edu.unq.ciu.exceptions

import org.uqbar.commons.model.UserException

class ContraseniaIncorrecta extends UserException{
    new(){
        super("Contraseña incorrecta")
    }

}