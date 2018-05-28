//
//  iniciarSesionViewController.swift
//  Lab10-Firebase-Bill
//
//  Created by MAC01 on 16/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class iniciarSesionViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in print("Intentando iniciar sesion :p")
            if error != nil{
                print("Se presento el siguiente error: \(error)")
                self.mostarAlerta(title: "Error", message: "Cuenta invalida registrarse", action: "Registrarse")
            }else{
                print("Inicio de Sesion Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
        }
    }
}
    func mostarAlerta(title: String, message: String, action: String){
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelok = UIAlertAction(title: action, style: .default, handler: { action in self.performSegue(withIdentifier: "registrarseSegue", sender: nil) } )
        alertaGuia.addAction(cancelok)
        present(alertaGuia, animated: true, completion: nil)
    }
}
