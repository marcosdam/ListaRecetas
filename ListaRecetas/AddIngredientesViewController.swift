//
//  AddIngredientesViewController.swift
//  ListaRecetas
//
//  Created by Marcos Ledesma on 26/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit
// Protocolo ANTES DE LA CLASE (para poder enviar la lista de ingredientes a la receta y añadirsela)
protocol ObtenerIngredientesDelegate {
    func obtenerIngredientes(ingredientes: [String])
}

class AddIngredientesViewController: UIViewController {
    // Vars para añadir ingredientes a la receta
    @IBOutlet weak var txtIngrediente1: UITextField!
    @IBOutlet weak var txtIngrediente2: UITextField!
    @IBOutlet weak var txtIngrediente3: UITextField!
    
    // Var delegate (para enviar la lista)
    var delegate: ObtenerIngredientesDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Añadir ingredientes al array de la receta
    @IBAction func btnAddIngredientesClick(_ sender: Any) {
        if let ingrediente1 = txtIngrediente1.text, let ingrediente2 = txtIngrediente2.text, let ingrediente3 = txtIngrediente3.text {
            // lista temporal
            let temp = [ingrediente1, ingrediente2, ingrediente3]
            // Pasarlos al delegate para obtenerlos desde el principal
            delegate?.obtenerIngredientes(ingredientes: temp)
        }else{
            // Cuando algún dato no esté bien aparece AlertDialog
            let alerta = UIAlertController(title: "ERROR", message: "Asegúrate de haber introducido texto", preferredStyle: .alert)
            // Añadimos la acción
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            // Mostrar Alert
            self.present(alerta, animated: true, completion: nil)
        }
    }
}
