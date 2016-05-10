package ar.edu.unq.ciu.controllers

import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import ar.edu.unq.ciu.errores.NoExisteElUsuario
import org.uqbar.xtrest.api.XTRest

@Controller
class LaberintosController {

    extension JSONUtils = new JSONUtils

    GatoEncerradoRepoDeObjetos repoDeObjetos

    @Get('/laberintos/:id')
    def laberintos(){
        response.contentType = "application/json"
        val iId = Integer.valueOf(id)

        try {
            ok(laberintosParaUsuario(iId).toJson)
        }
        catch (UserException e) {
            notFound(e.message);
        }
    }

    def laberintosParaUsuario(Integer usuarioId){
        validarUsuarioExistente(usuarioId)
        // TODO renderear laberintos, depende de la implementacion de repo de objetos y del minificador
//        repoDeObjetos.laberintos
        1 // para que no rompa // TODO borrar!!!!
    }

    new(){
        repoDeObjetos = new GatoEncerradoRepoDeObjetos
    }

    def validarUsuarioExistente(Integer id){
        if(!(repoDeObjetos.existeElUsuario(id))){
            throw new NoExisteElUsuario
        }
    }

    def static void main(String[] args) {
        XTRest.start(LaberintosController, 9000)
    }
}