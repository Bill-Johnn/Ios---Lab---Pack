//
//  ViewController2.swift
//  Paises_Bill
//
//  Created by MAC01 on 6/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var Tabla2: UITableView!
    var per = ["Arequipa","Chiclayo"]
    var arg = ["Buenos Aires", "Bariloche"]
    var ven = ["Puerto de la Cruz", "Parque Nacional Morrocoy"]
    var col = ["Santa Marta","Isla Gorgona"]
    var chi = ["Laguna San Rafael","Carretera Austral"]
    var nombrePaisRecibido: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tabla2.dataSource = self
        Tabla2.delegate = self
        //Tabla2.text = nombrePaisRecibido!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let celda2 = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "Celda")
        if nombrePaisRecibido=="Perù"{
            celda2.textLabel?.text = per[indexPath.row]
            return celda2
        }else if nombrePaisRecibido=="Argentina"{
            celda2.textLabel?.text = arg[indexPath.row]
            return celda2
        }else if nombrePaisRecibido=="Venezuela"{
            celda2.textLabel?.text = ven[indexPath.row]
            return celda2
        }else if nombrePaisRecibido=="Colombia"{
            celda2.textLabel?.text = col[indexPath.row]
            return celda2
        }
        celda2.textLabel?.text = chi[indexPath.row]
        return celda2
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idLugarSeleccionado = indexPath.row
        self.performSegue(withIdentifier: "pantallaTresSegue", sender: idLugarSeleccionado)
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "pantallaTresSegue" {
            let idLugarSeleccionadoRecibido = sender as! Int
            let objPantalla3:ViewController3v1 = segue.destination as! ViewController3v1
            
            if nombrePaisRecibido=="Perù"{
                objPantalla3.nombreImgRecibido = per[idLugarSeleccionadoRecibido]
            }else if nombrePaisRecibido=="Argentina"{
                objPantalla3.nombreImgRecibido = arg[idLugarSeleccionadoRecibido]
            }else if nombrePaisRecibido=="Venezuela"{
                objPantalla3.nombreImgRecibido = ven[idLugarSeleccionadoRecibido]
            }else if nombrePaisRecibido=="Colombia"{
                objPantalla3.nombreImgRecibido = col[idLugarSeleccionadoRecibido]
            }else if nombrePaisRecibido=="Chile"{
            objPantalla3.nombreImgRecibido = chi[idLugarSeleccionadoRecibido]
            }
            
            
            
            //objPantalla3.nombreImgRecibido = per[idLugarSeleccionadoRecibido]
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
