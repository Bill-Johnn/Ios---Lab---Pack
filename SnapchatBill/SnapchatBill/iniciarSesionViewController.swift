//
//  iniciarSesionViewController.swift
//  SnapchatBill
//
//  Created by MAC01 on 14/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextFiled.text!, link: passwordTextFiled.text!){
            (user, error) in
            print("Intentando Iniciar Sesionhjbeavkndskb")
            if error != nil{
                print("Se presento un error: \(error)")
            }else{
                print("Inicio de ssesion bien =D")
            }
        }
    }
    

}

