//
//  CursoCompletadoViewController.swift
//  BillRegistraCursos
//
//  Created by MAC01 on 24/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class CursoCompletadoViewController: UIViewController {
  
    @IBOutlet weak var txtCurso: UITextField!
    @IBOutlet weak var txtNot1: UITextField!
    @IBOutlet weak var txtNot2: UITextField!
    @IBOutlet weak var txtNot3: UITextField!
    @IBOutlet weak var txtNot4: UITextField!
    @IBOutlet weak var txtPrLa: UITextField!
    @IBOutlet weak var txtExFi: UITextField!
    @IBOutlet weak var actualizarbtn: UIButton!

    var curso:Curso? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCurso.text = String(curso!.nom_curso!)
        txtNot1.text = "\(curso!.not1!)"
        txtNot2.text = "\(curso!.not2!)"
        txtNot3.text = "\(curso!.not3!)"
        txtNot4.text = "\(curso!.not4!)"
        txtPrLa.text = "\(curso!.pro_lab!)"
        txtExFi.text = "\(curso!.exa_final!)"
    }
    @IBAction func btnAgre(_ sender: Any) {
        if curso != nil {
            curso!.nom_curso = txtCurso.text
            curso!.not1 = txtNot1.text
            curso!.not2 = txtNot2.text
            curso!.not3 = txtNot3.text
            curso!.not4 = txtNot4.text
            curso!.pro_lab = txtPrLa.text
            curso!.exa_final = txtExFi.text
        }else{
            let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let curso = Curso(context: context)
            curso.nom_curso = txtCurso.text
            curso.not1 = txtNot1.text
            curso.not2 = txtNot2.text
            curso.not3 = txtNot3.text
            curso.not4 = txtNot4.text
            curso.pro_lab = txtPrLa.text
            curso.exa_final = txtExFi.text
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
