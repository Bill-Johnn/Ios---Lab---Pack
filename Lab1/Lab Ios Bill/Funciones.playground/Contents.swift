//: Playground - noun: a place where people can play

import UIKit

func NumeroAlCuadrado (numero:Int){
    let resultado = numero*numero
    print("El cuadrado de \(numero) es \(resultado)")
}

func NumeroAlCubo(_ numero:Int){
    let resultado = pow(Double(numero), 3)
    print("el cuadrado de \(numero) es \(resultado)")
}

func esPar(numero:Int)->Bool{
    if numero % 2 == 0 {
        return true
    }else{
        return false
    }
}

if esPar (numero: 3){
    NumeroAlCuadrado(numero: 2)
}else{
    NumeroAlCubo(3)
}