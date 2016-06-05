package ar.edu.unq.ciu.controllers

import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.ciu.appHelpers.AppRepoDeObjetos
import ar.edu.unq.ciu.appHelpers.Minificador
import ar.edu.unq.ciu.appHelpers.RepoUsuarios
import ar.edu.unq.ciu.appHelpers.JSONPropertyUtils
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import ar.edu.unq.ciu.GatoEncerradoDominio.Login


@Controller
class LaberintosController {

    extension JSONUtils = new JSONUtils
    extension JSONPropertyUtils = new JSONPropertyUtils

    AppRepoDeObjetos repoDeObjetos
    Minificador minificador

	new(){
		repoDeObjetos = new AppRepoDeObjetos
		minificador = new Minificador
	}

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


    def laberintosDelUsuario(Integer id){
        repoDeObjetos.laberintosDe(id)
    }

	@Get("/iniciarLaberinto/:idUser/:idLab")
	def Result iniciarLaberinto() {
		
		response.contentType = "application/json"
		
		val Integer idUsuario = Integer.valueOf(idUser)
		val idLaberinto = Integer.valueOf(idLab)

		try{
			ok(iniciarLaberinto(idUsuario,idLaberinto).toJson)
		} catch (UserException e) {
			notFound(e.message);
		}
	}
	
	def iniciarLaberinto(Integer idUsuario, Integer idLaberinto){
		minificador.minificar(laberinto(idUsuario,idLaberinto))
	}

    def laberinto(Integer idUsuario, Integer idLaberinto){
        repoDeObjetos.iniciarJuego(idUsuario, idLaberinto)
    }

	@Get("/realizarAccion/:idUser/:idHab/:idAcc")
	def Result realizarAccionEnHabitacion() {
		
		response.contentType = "application/json"
		
		val idHabitacion = Integer.valueOf(idHab)
		val idAccion = Integer.valueOf(idAcc)
		val idUsuario = Integer.valueOf(idUser)

		try{
			ok(realizarAccion(idUsuario, idHabitacion, idAccion).toJson)
		} catch (UserException e) {
			notFound(e.message);
		}
	}

    def realizarAccion(Integer idUsuario, Integer idHabitacion, Integer idAccion){
        repoDeObjetos.accion(idUsuario, idHabitacion, idAccion)
    }
	
	@Post('/login/')
	def Result loguear(@Body String body) {
		try {
			val login = body.fromJson(Login)

			val usuario = body.getPropertyValue("nombreUsuario")
			val pass = body.getPropertyValue("password")

			ok('{ "status" : "OK" }');
		} catch (UserException e) {
			notFound(e.message)
		}
        //TODO implementar esto
	}

    def static void main(String[] args) {
        XTRest.start(LaberintosController, 9000)
    }
}