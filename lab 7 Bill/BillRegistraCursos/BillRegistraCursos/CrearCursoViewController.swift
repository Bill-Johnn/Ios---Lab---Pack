//
//  CrearCursoViewController.swift
//  BillRegistraCursos
//
//  Created by MAC01 on 24/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {
    @IBOutlet weak var txtCurso: UITextField!
    

    @IBOutlet weak var not1: UITextField!
    @IBOutlet weak var not2: UITextField!
    @IBOutlet weak var not3: UITextField!
    @IBOutlet weak var not4: UITextField!

    @IBOutlet weak var txtPromLab: UITextField!
    @IBOutlet weak var txtExaFin: UITextField!
    @IBOutlet weak var swiColor: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func Ingresar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Curso(context: context)
        curso.nom_curso = txtCurso.text!
        curso.not1 = not1.text!
        curso.not2 = not2.text!
        curso.not3 = not3.text!
        curso.not4 = not4.text!
        curso.pro_lab = txtPromLab.text!
        curso.exa_final = txtExaFin.text!
        curso.estado = swiColor.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
