package ar.edu.unq.ciu.GatoEncerradoDominio.test.admin

import org.junit.Before
import org.junit.Test
import ar.edu.unq.ciu.GatoEncerradoDominio.Login
import ar.edu.unq.ciu.GatoEncerradoDominio.Usuario
import static org.junit.Assert.*

class TestLogin {
	
	Login login
	Usuario agsmith
	Usuario malvarenga
	
	@Before
	def void setUp(){
		login = new Login

		agsmith = new Usuario
		agsmith.nombre = "agsmith"
		agsmith.password = "agsmith"
		
		malvarenga = new Usuario
		malvarenga.nombre = "malvarenga"
		malvarenga.password = "malvarenga"
		
		login.usuarios.add(agsmith)
		login.usuarios.add(malvarenga)
	}
	
	@Test
	def loginCorrecto(){
		login.nombreUsuario = "agsmith"
		login.passwordUsuario = "agsmith"
		var String mensajeExcepcion
		try{
			login.validarIngreso
		}catch(Exception e){
			mensajeExcepcion = e.message
		}

		assertNull(mensajeExcepcion)
		
	}
	
	@Test
	def loginFallidoPorContraseniaInvalida(){
		login.nombreUsuario = "agsmith"
		login.passwordUsuario = "felipe"
		var String mensajeExcepcion
		try{
			login.validarIngreso
		}catch(Exception e){
			mensajeExcepcion = e.message
		}

		assertNotNull(mensajeExcepcion)
		assertEquals(mensajeExcepcion,"Usuario o contraseña invalidos")
		
	}
	
	@Test
	def loginFallidoPorUsuarioInexistente(){
		login.nombreUsuario = "mgil"
		login.passwordUsuario = "mgil"
		var String mensajeExcepcion
		try{
			login.validarIngreso
		}catch(Exception e){
			mensajeExcepcion = e.message
		}

		assertNotNull(mensajeExcepcion)
		assertEquals(mensajeExcepcion,"Usuario o contraseña invalidos")
		
	}
	
}