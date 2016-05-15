package ar.edu.unq.ciu.controllers

import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.ciu.appHelpers.AppRepoDeObjetos
import ar.edu.unq.ciu.appHelpers.Minificador

@Controller
class LaberintosController {

    extension JSONUtils = new JSONUtils

    AppRepoDeObjetos repoDeObjetos
    Minificador minificador

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
        minificador.minificar(laberintosDelUsuario(usuarioId))
    }

    new(){
        repoDeObjetos = new AppRepoDeObjetos
        minificador = new Minificador
    }

    def laberintosDelUsuario(Integer id){
        repoDeObjetos.laberintosDe(id)
    }

    def static void main(String[] args) {
        XTRest.start(LaberintosController, 9000)
    }
}