//
//  IniciarSesionViewController.swift
//  TercerExamenBill
//
//  Created by MAC01 on 1/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class IniciarSesionViewController: UIViewController {
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailtxt.text!, password: passwordtxt.text!)
        {(user, error) in print("Intentando iniciar sesion =D")
            if error != nil{
                print("Error: \(error)")
                self.mostarAlerta(title: "Error", message: "Cuenta invalida o no existente", action: "Registrarse")
            }else{
                print("Inicio de Sesion Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionSegue", sender: nil)
            }
        }
    }
    
    func mostarAlerta(title: String, message: String, action: String){
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelok = UIAlertAction(title: action, style: .default, handler: { action in self.performSegue(withIdentifier: "registrarseSegue", sender: nil) } )
        alertaGuia.addAction(cancelok)
        present(alertaGuia, animated: true, completion: nil)
    }
override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let siguienteVC = segue.destination as! RegistroViewController
        siguienteVC.emailCont = emailtxt.text!
        siguienteVC.passwordCont = passwordtxt.text!
    }
}
