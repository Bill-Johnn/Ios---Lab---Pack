//
//  ElegirUsuarioMensajeViewController.swift
//  TercerExamenBill
//
//  Created by MAC01 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class ElegirUsuarioMensajeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var usuarios:[Usuario] = []
     var idusuario = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    
        Database.database().reference().child("usuarios").observe(DataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
        
        let usuario = Usuario()
        usuario.email = (snapshot.value as! NSDictionary)["email" ] as! String
        usuario.uid = snapshot.key
        self.usuarios.append(usuario)
        self.tableView.reloadData()
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let usuario = usuarios[indexPath.row]
        cell.textLabel?.text = usuario.email
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let usuario = usuarios[indexPath.row]
         idusuario = usuario.uid
        performSegue(withIdentifier: "mensajeSegue", sender: usuario)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVC = segue.destination as! MensajeViewController
        siguienteVC.usuarioAl = idusuario
    }
}
