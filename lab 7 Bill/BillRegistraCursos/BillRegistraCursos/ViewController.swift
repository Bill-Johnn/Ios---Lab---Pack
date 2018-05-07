//
//  ViewController.swift
//  BillRegistraCursos
//
//  Created by MAC01 on 24/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var cursos:[Curso] = []
    
    var cursoe:Curso? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       // self.tableView.isEditing=true
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            try cursos = context.fetch(Curso.fetchRequest())
            tableView.reloadData()
        }catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        if curso.estado{
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text = "\(curso.nom_curso!)"
        }else {
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "\(curso.nom_curso!)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // indexSeleccionado = indexPath.row
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "cursoSeleccionadaSegue", sender: curso)
    }
    
    @IBAction func agregarCurso(_ sender: Any) {
        performSegue(withIdentifier: "agregarSgue", sender: nil)
    }
    func obtenerTareas(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        }catch{
            print("Ha ocurrido un error")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cursoSeleccionadaSegue"{
            let siguienteVC = segue.destination as! CursoCompletadoViewController
            siguienteVC.curso = sender as! Curso
            //siguienteVC.anteriorVC = self
        } 
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let curso = cursos[indexPath.row]
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(curso)
            cursos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
}

