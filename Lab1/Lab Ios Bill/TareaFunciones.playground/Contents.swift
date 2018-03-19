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

func Suma (numero1:Int, numero2:Int){
    let resultado = numero1+numero2
    print("La suma es \(resultado)")
}

func Resta (numero:Int){
    
}

if esPar (numero: 3){
    NumeroAlCuadrado(numero: 2)
}else{
    NumeroAlCubo(3)
}