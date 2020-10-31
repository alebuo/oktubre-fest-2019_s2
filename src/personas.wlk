import marcas.*
import jarras.*
import carpas.*
import paises.*

class Persona {
	var property peso=0
	var property jarrasCompradas=[]
	var property leGustaMusicaTradicional
	var property nivelDeAguante=0
	var property nacionalidad=[]

	method estaEbrio(){
		return jarrasCompradas.sum({a => a.contenidoDeAlcohol()}) * peso > nivelDeAguante
	}
	method leGustanMarcas(cerveza){
		return true
	}
	method totalAlcoholIngerido(){
		return jarrasCompradas.sum({a=>a.contenidoDeAlcohol()})
	}
	method quiereEntrar(carpa){
		return carpa.hayBandaMusicaTradicional()==leGustaMusicaTradicional and self.leGustanMarcas(carpa.marcaCerveza())	
	}
	method comprarJarra(laJarra){
		jarrasCompradas.add(laJarra)
	}
	method esUnEbrioEmpedernido(){
		return jarrasCompradas.sum({a=>a.litros()})>1
	}
	method esPatriota(){
		return jarrasCompradas.all({a=>a.paisFabricacion()==[nacionalidad]})
	}
}
class Belga inherits Persona{
	override method leGustanMarcas(cerveza){
		return cerveza.graLupuloXLitro() > 4
	}
}
class Checa inherits Persona {
	override method leGustanMarcas(cerveza){
		return cerveza.graduacion()>8
	}
} 
class Aleman inherits Persona {
	override method quiereEntrar(carpa){
		return super(carpa) and carpa.personasDentroDeCarpa().size().even()
	}
}