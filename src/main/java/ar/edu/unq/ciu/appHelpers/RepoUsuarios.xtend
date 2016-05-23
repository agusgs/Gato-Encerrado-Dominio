package ar.edu.unq.ciu.appHelpers

import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioJugador
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Inventario
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.errores.NoExisteLaberintoParaUsuario
import ar.edu.unq.ciu.errores.NoExisteElUsuario
import ar.edu.unq.ciu.errores.NoExisteHabitacion
import ar.edu.unq.ciu.errores.NoExisteAccionParaHabitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.Item

class RepoUsuarios{
	
	ArrayList<UsuarioJugador> usuarios
	ArrayList<Habitacion> habitaciones
	ArrayList<Laberinto> laberintos
	static public RepoUsuarios repoUsuarios

    new(){
    	habitaciones = new ArrayList<Habitacion>
    	laberintos = new ArrayList<Laberinto> 
		usuarios = newArrayList
		
		(
			crearUsuario("agsmith", 1), 
			crearUsuario("malvarenga", 2), 
			crearUsuario("mgil", 3)
		)
        
        agregarLaberintoAUsuario(usuarios.get(0), crearLaberinto("edificio",11))
        agregarLaberintoAUsuario(usuarios.get(0), crearLaberinto("mansion",12))
        agregarInventarioALaberinto(usuarios.get(0).laberintos.get(0), crearInventario(31, "inventario", "descripcionInventario"))
        agregarInventarioALaberinto(usuarios.get(0).laberintos.get(1), crearInventario(31, "inventario2", "descripcionInventario2"))
    }
	
	def agregarInventarioALaberinto(Laberinto lab, Inventario inv) {
		lab.inventario = inv
	}
	
	def crearInventario(Integer id, String nombre, String descripcion){
		var Inventario inv = new Inventario
		inv.id = id
		inv.nombre = nombre
		inv.descripcion = descripcion
		inv
	}
    
    def crearUsuario(String nombre, Integer id){
    	
    	var UsuarioJugador user = new UsuarioJugador
		user.id = id
		user.nombre = nombre
		user
    }
    
    def agregarLaberintoAUsuario(UsuarioJugador usu, Laberinto lab){
    	usu.laberintos.add(lab)
    }
    
    def crearLaberinto(String nombre, Integer id){
    	var Laberinto lab = new Laberinto
    	lab.id = id
    	lab.nombre = nombre
    	lab.habitaciones.addAll(crearHabitacion("cocina",21), crearHabitacion("dormitorio",22), crearHabitacion("comedor",23))
    	laberintos.add(lab)
    	lab
    }
    
    def crearHabitacion(String nombre, Integer id){
    	var Habitacion hab = new Habitacion
    	hab.id = id
    	hab.nombre = nombre
    	hab.acciones.addAll(crearAccionMover("ir a patio", 31), crearAccionAgarrar("usar", 32))
    	habitaciones.add(hab)
    	hab
    }
    
    def crearAccionMover(String nombre, Integer id){
    	var acc = new AccionMover
    	acc.id = id
    	acc.nombre = nombre
    	acc
    }
    
	def crearAccionAgarrar(String nombre, Integer id){
    	var acc = new AccionAgarrar
    	acc.id = id
    	acc.nombre = nombre
    	var item = new Item
    	item.nombre = "martillo"
    	acc.item = item
    	acc
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
	
	def validarExisteLaberintoParaUsuario(Integer idUser, Integer idLab){
		if (!RepoUsuarios.getInstance.existeElLaberinto(idUser,idLab))
			throw new NoExisteLaberintoParaUsuario(idLab, idUser)
	}
	
	def validarExisteUsuario(Integer idUsuario){
		if (!existeElUsuario(idUsuario))
			throw new NoExisteElUsuario
	}
	
	/**
	 * PRE: existe la habitacion que se recibe
	 */
	def existeAccionEnHabitacion(Integer idHabitacion, Integer idAccion) {
		var habitacion = buscarHabitacion(idHabitacion)
		habitacion.acciones.exists[a| a.id == idAccion]
	}
	
	def validarExisteAccionEnHabitacion(Integer idHabitacion, Integer idAccion) {
		if (!RepoUsuarios.getInstance.existeAccionEnHabitacion(idHabitacion,idAccion))
			throw new NoExisteAccionParaHabitacion(idHabitacion, idAccion)
	}
	
	def buscarHabitacion(Integer id) {
		habitaciones.findFirst[it.id.equals(id)]
	}
	
	def validarExisteHabitacion(Integer id) {
		if (!existeHabitacion(id))
			throw new NoExisteHabitacion
	}
	
	def existeHabitacion(Integer id){
		habitaciones.exists[hab| hab.id == id]
	}
	
	def buscarAccion(Habitacion h, Integer id) {
		h.acciones.findFirst[it.id.equals(id)]
	}
	
	/**
	 * PRE: los idHabitacion son unicos y no se repiten entre laberintos distintos
	 */
	def buscarInventario(Habitacion habitacion) {
		var lab = laberintos.findFirst[it.habitaciones.contains(habitacion)]
		lab.inventario
	}

}