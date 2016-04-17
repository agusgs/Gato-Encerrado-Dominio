package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

import java.util.List
import java.util.ArrayList

@Accessors
@Observable
class Login {

    List<Usuario> usuarios
	String nombreUsuario
	String passwordUsuario

	new() {
        usuarios = new ArrayList<Usuario>()
	}

    def validarIngreso(){
        if(!macheaConAlgunUsuario())
            throw new UserException("Usuario o contraseña invalidos")
    }

    def macheaConAlgunUsuario(){
        return usuarios.exists[usuario|usuario.macheaCon(nombreUsuario, passwordUsuario)]
    }

    def usuarioQueMachea(){
        validarIngreso
        return usuarios.findFirst[usuario|usuario.macheaCon(nombreUsuario, passwordUsuario)]
    }
}
