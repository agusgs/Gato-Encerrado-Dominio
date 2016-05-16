package ar.edu.unq.ciu.repo

import java.util.ArrayList
import ar.edu.unq.ciu.minificados.InventarioMini
import ar.edu.unq.ciu.minificados.LaberintoMini
import ar.edu.unq.ciu.minificados.HabitacionMini
import ar.edu.unq.ciu.minificados.UsuarioMini

class RepoUsuarios{
	
	ArrayList<UsuarioMini> usuarios

	static public RepoUsuarios repoUsuarios

    new(){
    	
		usuarios = newArrayList
		
		(
			crearUsuario("agsmith", 1), 
			crearUsuario("malvarenga", 2), 
			crearUsuario("mgil", 3)
		)
        
        agregarLaberintoAUsuario(usuarios.get(0), crearLaberinto("edificio",11))
        agregarLaberintoAUsuario(usuarios.get(0), crearLaberinto("mansion",12))
        agregarInventarioALaberinto(usuarios.get(0).laberintos.get(0), crearInventario(31, "inventario", "descripcionInventario"))
    }
	
	def agregarInventarioALaberinto(LaberintoMini lab, InventarioMini inv) {
		lab.inventario = inv
	}
	
	def crearInventario(Integer id, String nombre, String descripcion){
		var InventarioMini inv = new InventarioMini
		inv.id = id
		inv.nombre = nombre
		inv.descripcion = descripcion
		inv
	}
    
    def crearUsuario(String nombre, Integer id){
    	
    	var UsuarioMini user = new UsuarioMini
		user.id = id
		user.nombre = nombre
		user
    }
    
    def agregarLaberintoAUsuario(UsuarioMini usu, LaberintoMini lab){
    	usu.laberintos.add(lab)
    }
    
    def crearLaberinto(String nombre, Integer id){
    	var LaberintoMini lab = new LaberintoMini
    	lab.id = id
    	lab.nombre = nombre
    	lab.habitaciones.addAll(crearHabitacion("cocina",21), crearHabitacion("dormitorio",22), crearHabitacion("comedor",23))
    	lab
    }
    
    def crearHabitacion(String nombre, Integer id){
    	var HabitacionMini hab = new HabitacionMini
    	hab.id = id
    	hab.nombre = nombre
    	hab.acciones.addAll()
    	hab
    }
    
    static val INSTANCE = new RepoUsuarios
	def static getInstance() {
		INSTANCE
	}
	
	def buscarUsuario(Integer id) {
		usuarios.findFirst[it.id.equals(id)]
	}
	
	def buscarLaberinto(Integer idUser, Integer idLab) {
		var usuario = buscarUsuario(idUser)
		usuario.laberintos.findFirst[it.id.equals(idLab)]
	}
	
	  def existeElUsuario(Integer idDeUsuario){
	  	usuarios.exists[usuario| usuario.id == idDeUsuario]
	  	
	}
	
	/**
	 * PRE: existe el usuario que se recibe
	 */
	def existeElLaberinto(Integer idUser, Integer idLab) {
		var usuario = buscarUsuario(idUser)
		usuario.laberintos.exists[l| l.id == idLab]
	}

}