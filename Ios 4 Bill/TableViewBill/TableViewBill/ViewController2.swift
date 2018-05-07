//
//  ViewController2.swift
//  TableViewBill
//
//  Created by MAC01 on 2/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var vistaWeb: UIWebView!
    
    var nombrePdfRecibido: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        habilitarZoom()
        mostrarPdf()
    }

    func mostrarPdf(){
        let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: nombrePdfRecibido!, ofType: "pdf", inDirectory: "PDF")!)
        
        let datosPdf = try? Data(contentsOf: direccionPdf)
        
        vistaWeb.load(datosPdf!, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionPdf)
    }
    
    func habilitarZoom(){
        vistaWeb.scalesPageToFit = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
