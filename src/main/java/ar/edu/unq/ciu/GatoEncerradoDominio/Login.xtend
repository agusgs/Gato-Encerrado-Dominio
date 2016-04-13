package ar.edu.unq.ciu.GatoEncerradoDominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Login {
	String usuario
	String password
	boolean passwordOk
	String passwordValida
	String aQueAposto
	
	new() {
		passwordValida = "interfaces"	
	}
	
	new(String unaPassword) {
		passwordValida = unaPassword	
	}
		
	def void setPassword(String unaPassword) {
		passwordOk = unaPassword == passwordValida
	}
	
}
