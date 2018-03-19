//: Playground - noun: a place where people can play

import UIKit

var str = "Felipe Esquivel Osorio"

var cantidad = str.characters.count
var inicio = str.index(str.startIndex, offsetBy: 5)
var intermedio = str.index(str.starIndex, offsetBy: 2)
var fin = str.index(str.endIndex, offsetBy: -10)
let subcadenainicio = str.substring(to: inicio)
let subcadenafin = str.substring(to: fin)
print("Cadena desde inicio : \(subcadenainicio)")
print("Cadena desde inicio : \(subcadenafin)")

let buscar: Range<String.Index> = str.range(of: "p")!
let encontrado: Int = str.distance(from: str.startIndex, to: buscar.lowerBound)
var iniciox = str.index(str.startIndex, offsetBy: encontrado)
let nuevacadena:String = str.substring(from: iniciox)
print("Mostrar desde valor buscado: \(nuevacadena)")