package ar.edu.unq.ciu.repo

import ar.edu.unq.ciu.GatoEncerradoDominio.Usuario
import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto

class RepoUsuarios{
	
	ArrayList<Usuario> usuarios

	static public RepoUsuarios repoUsuarios

    new(){
    	
		usuarios = newArrayList
		
		(
			crearUsuario("agsmith", 1), 
			crearUsuario("malvarenga", 2), 
			crearUsuario("mgil", 3)
		)
        
    }
    
    def crearUsuario(String nombre, Integer id){
    	
    	val Usuario user = new Usuario
		user.id = id
		user.nombre = nombre
		user.password = nombre
		user.laberintos.addAll(crearLaberinto("edificio",1982), crearLaberinto("mansion",1900))
		user
    }
    
    def crearLaberinto(String nombre, Integer id){
    	val Laberinto lab = new Laberinto
    	lab.id = id
    	lab.nombre = nombre
    	lab.habitaciones.addAll()
    	lab
    }
    
    static val INSTANCE = new RepoUsuarios
	def static getInstance() {
		INSTANCE
	}
	
	def buscarUsuario(Integer id) {
		usuarios.findFirst[it.id.equals(id)]
		//if (usuarios.isEmpty)
			//throw new Exception() 
	}
	
	def buscarLaberinto(Integer idUser, Integer idLab) {
		val usuario = buscarUsuario(idUser)
		usuario.laberintos.findFirst[it.id.equals(idLab)]
	}

}