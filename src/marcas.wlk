import jarras.*
import carpas.*
import personas.*
import paises.*

class Cerveza {
	var property graLupuloXLitro=0
	var property paisFabricacion
}
class Rubia inherits Cerveza {
	var property graduacion=0
}
class Negra inherits Cerveza{	
	method graduacion(){
	return (graduacionReglamentaria.graduacion()).min(self.graLupuloXLitro()*2)
	}
}
class Roja inherits Negra {
	override method graduacion(){
	return super()*1.25
	}
}
object graduacionReglamentaria{
  var property graduacion=0
  method graduacion() = graduacion
}