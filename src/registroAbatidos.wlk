
object registroCOD {

	const regAbatidos = []
	const diasAbatidos=[]
	 
	method agregarAbatidosDia(cantidad, dia){
		if (diasAbatidos.contains(dia)) 
			self.error("Ya existe registro para el día indicado")
		regAbatidos.add(cantidad) 
		diasAbatidos.add(dia)
	}
	
	method agregarAbatidosVariosDias(listaReg , listaDia){
		if(!diasAbatidos.asSet().intersection(listaDia).isEmpty())
			self.error("Ya existe registro para alguno de los días indicados")
		regAbatidos.addAll(listaReg)
		diasAbatidos.addAll(listaDia)
	}
	
	method posicionDelDia(dia){
		var posicion=0
		(0..diasAbatidos.size()-1).forEach({i => if (diasAbatidos.get(i).equals(dia)) posicion=i})
			return posicion
	}
	
	method eliminarElRegistroDelDia(dia){
		if(!diasAbatidos.contains(dia))
			self.error("No existe el dia en el registro")
		regAbatidos.remove(self. posicionDelDia(dia))
		diasAbatidos.remove(self. posicionDelDia(dia))
	}
	
	method eliminarElRegistroDeDias(listaDias){
		listaDias.forEach({d => self.eliminarElRegistroDelDia(d)})
	}
	
	method cantidadDeDiasRegistrados()= regAbatidos.size()
	method estaVacioElRegistro()= regAbatidos.isEmpty()
	method algunDiaAbatio(cantidad)= regAbatidos.contains(cantidad) //si el objeto esta en la lista
	method primerValorDeAbatidos()= regAbatidos.first()
	method ultimoValorDeAbatidos()= regAbatidos.last()
	method maximoValorDeAbatidos()= regAbatidos.max()
	method totalAbatidos()= regAbatidos.sum()
	method cantidadDeAbatidosElDia(dia)= regAbatidos.get(self.posicionDelDia(dia))
	method ultimoValorDeAbatidosConSize()= regAbatidos.get(regAbatidos.size()-1)
	method diasConAbatidosSuperioresA(cuanto)= diasAbatidos.filter({d => regAbatidos.get(self.posicionDelDia(d))>cuanto})
	method valoresDeAbatidosPares()= regAbatidos.filter({r => r.even()}) // divide por 2
	method elValorDeAbatidos(cantidad)= regAbatidos.find(cantidad) // devuelve un objeto q cumple condicion
	method abatidosSumando(cantidad)= regAbatidos.map({r => r + cantidad})
	method abatidosEsAcotada(n1,n2)= regAbatidos.all({r => r.between(n1, n2)})
	method algunDiaAbatioMasDe(cantidad)= regAbatidos.any({r => r > cantidad})
	method todosLosDiasAbatioMasDe(cantidad)= regAbatidos.all({r => r > cantidad})
	method cantidadAbatidosMayorALaPrimera()= regAbatidos.count({r => r > regAbatidos.first()})
	method esCrack(){
		if (regAbatidos.isEmpty())
			self.error("No existe registro")
		if(regAbatidos.size()<2) 
			return false
		else return (0..regAbatidos.size()-2).all({r => regAbatidos.get(r)> (regAbatidos.get(r+1))})
	}
	
		
}