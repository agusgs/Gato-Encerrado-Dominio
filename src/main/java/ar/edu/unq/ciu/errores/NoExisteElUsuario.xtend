package ar.edu.unq.ciu.errores

import org.uqbar.commons.model.UserException

class NoExisteElUsuario extends UserException{
    new(){
        super('¡Pone un usuario que exista gil! Ni que fuera tan difícil.')
    }
}