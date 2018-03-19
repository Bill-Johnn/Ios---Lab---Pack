//: Playground - noun: a place where people can play

import UIKit

var Dividendo = 144
var divisor = 12
var p = 1
var q = 0

if (Dividendo >= divisor) {
    while ((Dividendo-divisor)>=q) {
        q = divisor*p
        p += 1
    }
    print("El cociente es:  \(p-1) y el residuo es \(Dividendo-q)")
}else{
print("El denomindaor debe ser meno")
}
