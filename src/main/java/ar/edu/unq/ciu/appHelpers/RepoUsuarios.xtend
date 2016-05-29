package ar.edu.unq.ciu.appHelpers

import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoDominio.UsuarioJugador
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Inventario
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.errores.NoExisteLaberintoParaUsuario
import ar.edu.unq.ciu.errores.NoExisteElUsuario
import ar.edu.unq.ciu.errores.NoExisteAccionParaHabitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.minificados.RespuestaAgarrar
import ar.edu.unq.ciu.minificados.RespuestaMover
import ar.edu.unq.ciu.minificados.RespuestaUsar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar
import ar.edu.unq.ciu.errores.NoExisteHabitacionParaElUsuario
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionGanar

class RepoUsuarios{
	
	ArrayList<UsuarioJugador> usuarios
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
        
        usuarios.get(0).laberintos.get(1).habitaciones.addAll(
    		crearHabitacion("cocina",21), 
    		crearHabitacion("dormitorio",22), 
    		crearHabitacion("comedor",23)
    	)
    	
    	usuarios.get(0).laberintos.get(1).habitaciones.get(2).acciones.addAll(
    		crearAccionMover("ir a patio", 41), 
    		crearAccionAgarrar("martillo", 42), 
    		crearAccionUsar(new AccionMover,43),
    		crearGanar(44)
    	)
        
        
        agregarInventarioALaberinto(usuarios.get(0).laberintos.get(0), 
        	crearInventario(31, "inventario", "descripcionInventario")
        )
        agregarInventarioALaberinto(usuarios.get(0).laberintos.get(1), 
        	crearInventario(32, "inventario2", "descripcionInventario2")
        )
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
    	lab
    }
    
    def crearHabitacion(String nombre, Integer id){
    	var Habitacion hab = new Habitacion
    	hab.id = id
    	hab.nombre = nombre
    	hab
    }
	
	def crearGanar(Integer id) {
		var acc = new AccionGanar
		acc.id = id
		acc
	}
    
    def crearAccionUsar(Accion a, Integer id){
    	var acc = new AccionUsar
    	acc.accion = a
    	acc.id = id
    	var item = new Item
    	item.nombre = "martillo"
    	acc.item = item
    	acc.accion = crearAccionAgarrar("pala", 44)
    	acc
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
		if (!existeElLaberinto(idUser,idLab))
			throw new NoExisteLaberintoParaUsuario(idLab, idUser)
	}
	
	def validarExisteUsuario(Integer idUsuario){
		if (!existeElUsuario(idUsuario))
			throw new NoExisteElUsuario
	}
	
	def existeAccionEnHabitacion(Integer idHabitacion, Integer idAccion, Integer idUsuario) {
		var habitacion = buscarHabitacion(idHabitacion, idUsuario)
		habitacion.acciones.exists[a| a.id == idAccion]
	}
	
	def validarExisteAccionEnHabitacion(Integer idHabitacion, Integer idAccion, Integer idUsuario) {
		if (!existeAccionEnHabitacion(idHabitacion, idAccion, idUsuario))
			throw new NoExisteAccionParaHabitacion(idHabitacion, idAccion)
	}
	
	/**
	 * PRE: la habitacion existe para ese usuario
	 */
	def buscarHabitacion(Integer idHabitacion, Integer idUser) {
		var usuario = buscarUsuario(idUser)
		var laberintos = usuario.laberintos
		val habitaciones = new ArrayList<Habitacion>
		
		laberintos.forEach[l| habitaciones.addAll(l.habitaciones)]
		
		habitaciones.findFirst[it.id.equals(idHabitacion)]
	}

	def buscarAccion(Habitacion h, Integer id) {
		h.acciones.findFirst[it.id.equals(id)]
	}
	
	/**
	 * PRE: los idHabitacion son unicas y no se repiten entre laberintos distintos
	 */
	def respuestaRealizarAccion(Habitacion habitacion, Accion acc, Integer idUsuario) {
		
		habitacion.usarAccion(acc)
		
		var usuario = buscarUsuario(idUsuario)
		if (acc.tipo.equals("agarrar"))
			return respuestaAccionAgarrar(habitacion, usuario)
		else if(acc.tipo.equals("mover"))
				return respuestaAccionMover(habitacion, usuario)
				else if(acc.tipo.equals("usar"))
						return respuestaAccionUsar(habitacion, usuario)
						else return respuestaAccionGanar()
	}
	
	def respuestaAccionUsar(Habitacion habitacion, UsuarioJugador jugador) {
		var resp = new RespuestaUsar
		resp.inv = buscarInventario(jugador, habitacion)
		resp
	}
	
	def respuestaAccionMover(Habitacion habitacion, UsuarioJugador jugador) {
		var resp = new RespuestaMover
		resp.habitacion = habitacion
		resp
	}
	
	def respuestaAccionGanar() {
		new String("Ganaste")
	}
	
	def respuestaAccionAgarrar(Habitacion habitacion, UsuarioJugador jugador) {
		var resp = new RespuestaAgarrar
		resp.hab = habitacion
		resp.inv = buscarInventario(jugador, habitacion)
		resp
	}
	
	def buscarInventario(UsuarioJugador jugador, Habitacion habitacion) {
		var lab = jugador.laberintos.findFirst[ l | l.habitaciones.contains(habitacion) ]
		lab.inventario
	}

	def validarExisteHabitacionParaUsuario(Integer idHabitacion, Integer idUser) {

		var usuario = buscarUsuario(idUser)
		var laberintos = usuario.laberintos
		val habitaciones = new ArrayList<Habitacion>
		
		laberintos.forEach[l| habitaciones.addAll(l.habitaciones)]
		
		if (!habitaciones.exists[it.id.equals(idHabitacion)])
			throw new NoExisteHabitacionParaElUsuario(idHabitacion,idUser)
		
	}

}