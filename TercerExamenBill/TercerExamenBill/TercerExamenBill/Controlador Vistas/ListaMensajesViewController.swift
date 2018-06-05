//
//  ListaMensajesViewController.swift
//  TercerExamenBill
//
//  Created by MAC01 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class ListaMensajesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var snaps:[Snap] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        Database.database().reference().child("usuarios").child((Auth.auth().currentUser?.uid)!).child("snaps").observe(DataEventType.childAdded, with: {(snapshot) in
            let snap = Snap()
                        snap.from = (snapshot.value as! NSDictionary)["from"] as! String
            snap.mensajeDescrip = (snapshot.value as! NSDictionary)["mensajeDescrip"] as! String
            snap.id = snapshot.key
            self.snaps.append(snap)
            self.tableView.reloadData()
        })
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if snaps.count == 0{
            return 1
        }else{
            return snaps.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if snaps.count == 0{
            cell.textLabel?.text = "No tienes Snaps 😂"
        }else {
            let snap = snaps[indexPath.row]
            cell.textLabel?.text = snap.from
            print(snap.from)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snap = snaps[indexPath.row]
        performSegue(withIdentifier: "versnapsegue", sender: snap)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "versnapsegue"{
            let siguienteVc = segue.destination as! VerMensajesViewController
            siguienteVc.snap = sender as! Snap
        }
    }
}
