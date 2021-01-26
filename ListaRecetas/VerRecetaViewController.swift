//
//  VerRecetaViewController.swift
//  ListaRecetas
//
//  Created by Marcos Ledesma on 26/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit
// Va a utilizar el protocolo ObtenerIngredientesDelegate creado en AddIngredientes para poder trarese la lista
// Además tiene que gestionar tablaRecetas -> UITableViewDataSource, UITableViewDelegate
class VerRecetaViewController: UIViewController, ObtenerIngredientesDelegate, UITableViewDataSource, UITableViewDelegate{
    
    // En esta vista quiero cargar todos los atributos de la receta en 3 labels y sus ingredientes (array) en la tabla (fila a replicar)
    
    func obtenerIngredientes(ingredientes: [String]) {
        <#code#>
    }


    // Vista -> labels (nombre, descripción, tiempo de cocción) y TablaIngredientes
    @IBOutlet weak var lblNombreVer: UILabel!
    @IBOutlet weak var lblDescripcionVer: UILabel!
    @IBOutlet weak var lblTiempoCoccionVer: UILabel!
    @IBOutlet weak var tablaIngredientes: UITableView!
    
    // lógica
    var receta: RecetaModel?
    var recetas: [RecetaModel] = []
    var ingrediente: String = ""
    var ingredientes: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // labels
        lblNombreVer.text = receta!.nombre
        lblDescripcionVer.text = receta!.descripcion
        lblTiempoCoccionVer.text = "(\receta!.tiempoCoccion)"
        // tableView, tableCell y label para recetas[]
        // ???
    }
    
    //
    // Métodos para utilizar UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    // Ver qué ingrediente tiene que coger, inflar la celda y devolverla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ingrediente = ingredientes[indexPath.row] // Position
        // Instanciar celda (Layout Inflater)
        let fila = tablaIngredientes.dequeueReusableCell(withIdentifier: "INGREDIENTE", for: indexPath) as! IngredienteTableViewCell
        
        fila.lblIngredienteCelda.text = ingrediente
        // Devolver la fila
        return fila
    }
    
}
