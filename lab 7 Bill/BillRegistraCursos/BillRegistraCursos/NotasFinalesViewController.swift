//
//  NotasFinalesViewController.swift
//  BillRegistraCursos
//
//  Created by MAC01 on 30/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class NotasFinalesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var cursos:[Curso] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //obtenerCursos()
        
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
        var notas:[Double] = []
        notas.append(Double(curso.not1!)!)
        notas.append(Double(curso.not2!)!)
        notas.append(Double(curso.not3!)!)
        notas.append(Double(curso.not4!)!)
        notas.sort()
        notas.remove(at: 0)
        let tre:Double = 0.3
        curso.pro_prac = String((notas[0] + notas[1] + notas[2])/3)
        let propra:Double = tre * Double(curso.pro_prac!)!
        let total:Double = (Double(curso.pro_lab!)! * 0.6) + (Double(curso.exa_final!)! * 0.1) + propra
        print(total)
        print(tre)
       // print(curso.pro_lab)
        if  total > 13 {
            cell.textLabel?.text = curso.nom_curso! + "😡\(total)"
        }else{
            cell.textLabel?.text = curso.nom_curso! + "😎\(total)"
        }
        return cell
    }
    func obtenerTareas(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        }catch{
            print("Ha ocurrido un error")
        }
    }
}
