//
//  RegistroViewController.swift
//  Lab10-Firebase-Bill
//
//  Created by MAC01 on 21/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistroViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func resgistrarse(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.emailText.text!, password: self.passwordText.text!, completion: {(user, error) in print("Intentando crear un usuario")
                    if error != nil{
                        print("Se presento error: \(error)")
                        self.mostarAlerta(title: "Cuenta existente", message: "El correo ya existe.", action: "Ok")
                        
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
