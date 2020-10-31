import marcas.*
import carpas.*
import personas.*
import paises.*

class Jarra{
	var property marca
	var property litros=0
	
	method contenidoDeAlcohol (){
		return litros * marca.sum({a=>a.graduacion()}) / 100 
	}
	method paisFabricacion(){
		return marca.paisFabricacion()
	}
}