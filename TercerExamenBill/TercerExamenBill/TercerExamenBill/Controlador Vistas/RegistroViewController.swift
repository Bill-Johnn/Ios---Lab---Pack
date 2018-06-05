//
//  RegistroViewController.swift
//  TercerExamenBill
//
//  Created by MAC01 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistroViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var contraseñaText: UITextField!
    
    var emailCont = ""
    var passwordCont = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailText.text? = emailCont
        contraseñaText.text? = passwordCont
    }
    @IBAction func resgistrarse(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.emailText.text!, password: self.contraseñaText.text!, completion: {(user, error) in print("Intentando crear usuario")
            if error != nil{
                print("Erroe \(error)")
                self.mostarAlerta(title: "Cuenta Existente", message: "La cuente ya esta registrada", action: "Ok")
            }else{
            print("Se creo")
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                
                self.performSegue(withIdentifier: "usuarioSegue", sender: nil)
            }
        })
    }
    func mostarAlerta(title: String, message: String, action: String){
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelok = UIAlertAction(title: action, style: .default, handler: nil)
        alertaGuia.addAction(cancelok)
        present(alertaGuia, animated: true, completion: nil)
    }
}
