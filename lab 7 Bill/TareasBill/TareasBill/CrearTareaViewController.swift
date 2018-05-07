//
//  CrearTareaViewController.swift
//  TareasBill
//
//  Created by MAC01 on 23/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class CrearTareaViewController: UIViewController {

    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var swImpoetante: UISwitch!
    
    //var anteriorVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func agregar(_ sender: Any) {
        //let tarea = Tarea()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tarea = Tarea(context: context)
        tarea.nombre = txtNombreTarea.text!
        tarea.importante = swImpoetante.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
