//
//  AddRecetaViewController.swift
//  ListaRecetas
//
//  Created by Marcos Ledesma on 26/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

// Protocolo ANTES DE LA CLASE (para poder obtener EN EL PRINCIPAL la receta de la activity AddReceta)
protocol ObtenerRecetaDelegate {
    func obtenerReceta(receta: RecetaModel)
}

class AddRecetaViewController: UIViewController {
    // Vars de la vista
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDescripcion: UITextField!
    @IBOutlet weak var txtTiempoCoccion: UITextField!
    
    
    // Var delegate (para obtener la receta)
    var delegate: ObtenerRecetaDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //btnAdd
    @IBAction func btnAddClick(_ sender: Any) {
        if let nombre = txtNombre.text, let descripcion = txtDescripcion.text, let tiempoCoccion = Int(txtTiempoCoccion.text ?? "0" ) {
            let receta = RecetaModel(nombre: nombre, descripcion: descripcion, tiempoCoccion: tiempoCoccion, ingredientes: nil)
            // Devolver la receta a la venta que me ha llamado ( como onActivityResult)
            // en la principal para trabajar sobre la receta
            delegate?.obtenerReceta(receta: receta)
        }else{
            // Cuando algún dato no esté bien aparece AlertDialog
            let alerta = UIAlertController(title: "ERROR", message: "Tienes datos mal introducidos", preferredStyle: .alert)
            // Añadimos la acción
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            // Mostrar Alert
            self.present(alerta, animated: true, completion: nil)
        }
    }

}
