//
//  PrincipalViewController.swift
//  TercerExamenBill
//
//  Created by MAC01 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tabla: UITableView!
    var arregloAcciones = ["1","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.dataSource = self
        tabla.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arregloAcciones.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "Celda")
        celda.textLabel?.text = arregloAcciones[indexPath.row]
        switch celda.textLabel?.text {
        case "1"?:
            celda.imageView?.image = UIImage(named: "1.png")
            celda.detailTextLabel?.text = "Enviar Mensaje"
        case "2"?:
            celda.imageView?.image = UIImage(named: "2.jpg")
            celda.detailTextLabel?.text = "Enviar Imagen"
        case "3"?:
            celda.imageView?.image = UIImage(named: "3.png")
            celda.detailTextLabel?.text = "Ver Mensajes/Imaegenes"
        default:
            celda.detailTextLabel?.text = "Descripcion"
        }
        return celda
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idSeleccionado = indexPath.row
        if idSeleccionado == 0{
            self.performSegue(withIdentifier: "enviarSegue", sender: idSeleccionado)
        }else if idSeleccionado == 1{
             self.performSegue(withIdentifier: "imagenSegue", sender: idSeleccionado)
        }else if idSeleccionado == 2{
            self.performSegue(withIdentifier: "verSegue", sender: idSeleccionado)
        }
       
    }
}
