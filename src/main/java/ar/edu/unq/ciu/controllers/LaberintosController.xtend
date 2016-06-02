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
        repoDeObjetos.laberinto(idUsuario, idLaberinto)
        // TODO implementar este metodo en laberinto
    }

	@Get("/realizarAccion/:idUser/:idHab/:idAccion")
	def Result realizarAccionEnHabitacion() {
		
		response.contentType = "application/json"
		
		val idHabitacion = Integer.valueOf(idHab)
		val idAction = Integer.valueOf(idAccion)
		val idUsuario = Integer.valueOf(idUser)

		try{
			RepoUsuarios.getInstance.validarExisteUsuario(idUsuario)
			RepoUsuarios.getInstance.validarExisteHabitacionParaUsuario(idHabitacion, idUsuario)
			RepoUsuarios.getInstance.validarExisteAccionEnHabitacion(idHabitacion, idAction, idUsuario)
			
			val habitacion = RepoUsuarios.getInstance.buscarHabitacion(idHabitacion, idUsuario)
			val accion = RepoUsuarios.getInstance.buscarAccion(habitacion, idAction)
			
			val accionRealizada = RepoUsuarios.getInstance.respuestaRealizarAccion(habitacion, accion, idUsuario)
			
			ok(accionRealizada.toJson)
		} catch (UserException e) {
			notFound(e.message);
		}
	}
	
	@Post('/login/')
	def Result loguear(@Body String body) {
	//Disculpe la molestia, gente trabajando..
		try {
			val login = body.fromJson(Login)

			val usuario = body.getPropertyValue("nombreUsuario")
			val pass = body.getPropertyValue("password")

			ok('{ "status" : "OK" }');
		} catch (UserException e) {
			notFound(e.message)
		}
	}

    def static void main(String[] args) {
        XTRest.start(LaberintosController, 9000)
    }
}