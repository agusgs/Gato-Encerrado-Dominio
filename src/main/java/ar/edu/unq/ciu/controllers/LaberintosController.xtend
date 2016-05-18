package ar.edu.unq.ciu.controllers

import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.ciu.appHelpers.AppRepoDeObjetos
import ar.edu.unq.ciu.appHelpers.Minificador
import ar.edu.unq.ciu.appHelpers.RepoUsuarios
import ar.edu.unq.ciu.errores.NoExisteLaberintoParaUsuario
import org.uqbar.xtrest.api.Result
import ar.edu.unq.ciu.errores.NoExisteElUsuario

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

	@Get("/iniciarLaberinto/:idUser/:idLab")
	def Result iniciarLaberinto() {
		
		response.contentType = "application/json"
		
		val Integer idUsuario = Integer.valueOf(idUser)
		val idLaberinto = Integer.valueOf(idLab)

		try{
			validarExisteUsuario(idUsuario)
			validarExisteLaberintoParaUsuario(idUsuario, idLaberinto)
			ok(iniciarLaberintoBusquedaLabYUser(idUsuario,idLaberinto).toJson)
			//ok(RepoUsuarios.getInstance.buscarLaberinto(idUsuario,idLaberinto).toJson)
		} catch (UserException e) {
			notFound(e.message);
		}
	}
	
	def iniciarLaberintoBusquedaLabYUser(Integer idUsuario, Integer idLaberinto){
		minificador.minicarLaberintoCompleto(RepoUsuarios.getInstance.buscarLaberinto(idUsuario,idLaberinto))
	}
	
	def validarExisteLaberintoParaUsuario(Integer idUser, Integer idLab){
		if (!RepoUsuarios.getInstance.existeElLaberinto(idUser,idLab))
			throw new NoExisteLaberintoParaUsuario(idLab, idUser)
	}
	
	def validarExisteUsuario(Integer idUsuario){
		if (!RepoUsuarios.getInstance.existeElUsuario(idUsuario))
			throw new NoExisteElUsuario
	}


    def static void main(String[] args) {
        XTRest.start(LaberintosController, 9000)
    }
}