package ar.edu.AlgoII.Grupo6

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import java.util.List
import java.util.ArrayList

@Accessors
class Usuario {
	double peso
	double altura
	char sexo
	String nombre
	Date fechaDeNacimiento
	List<String> preferencias 

	List<CondicionPreexistente> condicionesPreexistentes; 

	
	new (double elPeso, double laAltura)
	{
		peso = elPeso
		altura = laAltura
		preferencias = new ArrayList<String>()
		condicionesPreexistentes = new ArrayList<CondicionPreexistente>()
	}
	
	def double getIMC(){
		return peso / Math.pow(altura, 2);
	}
	
	def void validarObligatorios() {
		if(this.nombre.length <4 ) {
			throw new BusinessException("El nombre debe tener mas de 4 caracteres")
		}
		
		if(this.fechaDeNacimiento >= (new Date())  ) {
			throw new BusinessException("La fecha de nacimiento debe ser anteior a hoy")
		}
			
		condicionesPreexistentes.forEach[ 
			it.validarObligatorios(this)
		]
	}
	
	def void validarSexo() {
		condicionesPreexistentes.forEach[ 
			it.validarObligatorios(this)
		]
	}
	
	def void  validarPreferencias() {
		condicionesPreexistentes.forEach[ 
			it.validarObligatorios(this)
		]
	}

	def void validar() {
		validarObligatorios()
		validarSexo()
		validarPreferencias()
	}	
	
	
}