//
//  TareaCompletadaViewController.swift
//  TareasBill
//
//  Created by MAC01 on 23/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class TareaCompletadaViewController: UIViewController {
    @IBOutlet weak var tareaLabel: UILabel!
    var tarea:Tarea? = nil
      //var anteriorVC = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        if tarea!.importante {
            tareaLabel.text = "🙀\(tarea!.nombre!)"
        }else{
            tareaLabel.text = "🤥\(tarea!.nombre!)"
        }
    }

    @IBAction func completarTarea(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }

}
