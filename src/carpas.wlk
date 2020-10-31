import marcas.*
import jarras.*
import personas.*
import paises.*

class Carpa {
	var property cantLimiteAdmitida=0
	var property hayBandaMusicaTradicional
	var property marcaCerveza
	var property personasDentroDeCarpa=[]
	
	method dejarIngresar(persona){
		return personasDentroDeCarpa.size()+1 <= cantLimiteAdmitida and not persona.estaEbrio()
	}
	method puedeEntrar(persona){
		return  persona.quiereEntrar(self) and self.dejarIngresar(persona)
	}
	method ingresar(persona){
		if(self.puedeEntrar(persona)){ 
			personasDentroDeCarpa.add(persona)
		 	}else{
		 	self.error("No puede ingresar")
		 }
	}
	method servirJarra(persona,capacidad){
		const jarrita = new Jarra(marca=self.marcaCerveza(),litros=capacidad)
		
		if(personasDentroDeCarpa.contains(persona)){
			persona.comprarJarra(jarrita)
		}else{
			self.error("No esta en la carpa")
		}
	}
	method cantEbriosEmpedernidos(){
		return personasDentroDeCarpa.count({a=>a.esUnEbrioEmpedernido()})
	}
}