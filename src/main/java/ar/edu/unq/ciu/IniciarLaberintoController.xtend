package ar.edu.unq.ciu

import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import ar.edu.unq.ciu.repo.RepoUsuarios
import org.uqbar.xtrest.api.XTRest
import org.uqbar.commons.model.UserException
import ar.edu.unq.ciu.errores.NoExisteLaberintoParaUsuario

@Controller
class IniciarLaberintoController {
	
	extension JSONUtils = new JSONUtils
	
	@Get("/iniciarLaberinto/:idUser/:idLab")
	def Result iniciarLaberinto() {
		
		response.contentType = "application/json"
		
		val Integer idUsuario = Integer.valueOf(idUser)
		val idLaberinto = Integer.valueOf(idLab)

		try{
			validarExisteUsuario(idUsuario)
			validarExisteLaberintoParaUsuario(idUsuario, idLaberinto)
			ok(RepoUsuarios.getInstance.buscarLaberinto(idUsuario,idLaberinto).toJson)
		} catch (UserException e) {
			notFound(e.message);
		}
		
	}
	
	def validarExisteLaberintoParaUsuario(Integer idUser, Integer idLab){
		if (!RepoUsuarios.getInstance.existeElLaberinto(idUser,idLab))
			throw new NoExisteLaberintoParaUsuario(idLab, idUser)
	}
	
	def validarExisteUsuario(Integer idUsuario){
		if (!RepoUsuarios.getInstance.existeElUsuario(idUsuario))
			//Modificar cuando Agus mergee lo suyo
			throw new UserException("No existe el usuario con id " + idUsuario + "")
	}
	
	// NO FUNCIONA pero tampoco se pide
	@Get("/usuarios")
	def Result usuarios() {
		val usuarios = RepoUsuarios.getInstance
		response.contentType = "application/json"
		ok(usuarios.toJson)
	}
	
	def static void main(String[] args) {
		XTRest.start(IniciarLaberintoController, 9000)
	}
	
}