//
//  ImagenViewController.swift
//  TercerExamenBill
//
//  Created by MAC01 on 4/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class ImagenViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var Enviar: UIButton!
    
    var imagePicker = UIImagePickerController()
    var imagenID = NSUUID().uuidString
    var usuarioAl = ""
    var imagenURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mediaTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func enviarTapped(_ sender: Any) {
        let imagenesFolder =  Storage.storage().reference().child("imagenes")
        let imagenData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        let imagen = imagenesFolder.child("\(imagenID).jpg")
        imagen.putData(imagenData, metadata: nil) {(metadata ,error) in
            if error != nil {
                print("Ocurrio un error al subir imagen: \(error)")
                return
            }else{
                imagen.downloadURL(completion: {(url, error) in
                    guard let enlaceURL = url else{
                       print("Ocurrio un error al obtener informacion de imagen \(error)")
                        return
                    }
                    self.imagenURL = url!.absoluteString
                    //self.performSegue(withIdentifier: "seleccionarContactosegue", sender: nil)
                })
                
            }
        }
               let snap = ["from" : Auth.auth().currentUser?.email, "descripcion": descripcionTextField.text!, "imagenURL": imagenURL, "imagenID": imagenID]
        Database.database().reference().child("usuarios").child(usuarioAl).child("snaps").childByAutoId().setValue(snap)
        navigationController?.popViewController(animated: true)
    }
    
}
