package ar.edu.unq.ciu

import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import ar.edu.unq.ciu.repo.RepoUsuarios
import org.uqbar.xtrest.api.XTRest
import org.uqbar.commons.model.UserException

@Controller
class IniciarLaberintoController {
	
	extension JSONUtils = new JSONUtils
	
	@Get("/iniciarLaberinto/:idUser/:idLab")
	def Result iniciarLaberinto() {
		
		response.contentType = "application/json"
		
		val Integer idUsuario = Integer.valueOf(idUser)
		val idLaberinto = Integer.valueOf(idLab)
		
		try{
			ok(RepoUsuarios.getInstance.buscarUsuario(idUsuario).toJson)
		} catch (UserException e) {
			notFound("No existe el usuario con id " + idUser + "");
		}
		
		try{
			ok(RepoUsuarios.getInstance.buscarLaberinto(idUsuario,idLaberinto).toJson)
		} catch (UserException e) {
			notFound("No existe el laberinto " + idLab + " para el usuario con id " + idUser + "");
		}
 
	}
	
	@Get("/usuarios")
	def Result usuarios() {
		val usuarios = RepoUsuarios.getInstance
		//response.contentType = ContentType.APPLICATION_JSON
		ok(usuarios.toJson)
	}
	
	def static void main(String[] args) {
		XTRest.start(IniciarLaberintoController, 9000)
	}
	
}