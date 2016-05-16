package ar.edu.unq.ciu.minificados

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class UsuarioMini {
	
	Integer id
    String nombre
    //String password
    List<LaberintoMini> laberintos
    
    new(){
        laberintos = new ArrayList<LaberintoMini>
    }
    
}