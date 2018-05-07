//
//  InicioViewController.swift
//  BillRegistraCursos
//
//  Created by MAC01 on 30/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    var cursos:[Curso] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "incio"{
            
        
        let siguienteVC = segue.destination as! ViewController
        if txtUsuario.text == "DSIS" || txtContra.text == "TECSUP"{
        siguienteVC.cursoe = sender as? Curso
        }else{
            txtUsuario.text = ""
            txtContra.text = ""
        }
        }}
}
