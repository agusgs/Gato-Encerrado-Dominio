package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import java.util.ArrayList

@Accessors
class InventarioMini {
		
	Integer id
	String nombre
	String descripcion
	List<Accion> items
	
	new(){
		items = new ArrayList
	}
		
	new(Integer idI, String n, String d){
		items = new ArrayList<Accion>
		id = idI
		nombre = n
		descripcion = d
	}
}