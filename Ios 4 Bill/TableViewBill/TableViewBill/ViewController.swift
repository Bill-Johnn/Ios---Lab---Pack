//
//  ViewController.swift
//  TableViewBill
//
//  Created by MAC01 on 2/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var Tabla: UITableView!
    
    var contenidoCeldas = ["pdf1", "pdf2", "pdf3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tabla.dataSource = self
        Tabla.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoCeldas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "Celda")
        celda.textLabel?.text = contenidoCeldas[indexPath.row]
        return celda
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idPdfSeleccionado = indexPath.row
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: idPdfSeleccionado)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaDosSegue" {
            let idPdfSeleccionadoRecibido = sender as! Int
            let objPantalla2:ViewController2 = segue.destination as! ViewController2
            objPantalla2.nombrePdfRecibido = contenidoCeldas[idPdfSeleccionadoRecibido]
    }

}

}
