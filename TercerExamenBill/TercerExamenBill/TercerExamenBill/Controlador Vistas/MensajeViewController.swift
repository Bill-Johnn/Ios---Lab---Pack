//
//  MensajeViewController.swift
//  TercerExamenBill
//
//  Created by MAC01 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class MensajeViewController: UIViewController {

    @IBOutlet weak var mensajeTxt: UITextField!
    var usuarios:[Usuario] = []
    var usuarioAl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func enviarMensaje(_ sender: Any) {
        let snap = ["from" : Auth.auth().currentUser?.email, "mensajeDescrip": mensajeTxt.text!]
        
        Database.database().reference().child("usuarios").child(usuarioAl).child("snaps").childByAutoId().setValue(snap)
        navigationController?.popViewController(animated: true)
    }
    
}
