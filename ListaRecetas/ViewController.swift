//
//  ViewController.swift
//  ListaRecetas
//
//  Created by Marcos Ledesma on 26/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit
// Va a utilizar el protocolo ObtenerRecetaDelegate que hemos creado en AddReceta para poder trarese la receta
// Además tiene que gestionar una tabla -> UITableViewDataSource, UITableViewDelegate
class ViewController: UIViewController, ObtenerRecetaDelegate, UITableViewDataSource, UITableViewDelegate{
    
    // En esta vista (ViewController - "principal") solo es necesario cargar el nombre de la receta en la tabla
    
    //
    // Métodos para utilizar UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recetas.count
    }
    // Ver qué receta tiene que coger, inflar la celda y devolver la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let receta = recetas[indexPath.row] // Position -> indexPath.row
        // Instanciar celda (Layout Inflater)
        let fila = tablaRecetas.dequeueReusableCell(withIdentifier: "RECETA", for: indexPath) as! RecetaTableViewCell
        
        fila.lblRecetaCelda.text = receta.nombre
        // Devolver la fila
        return fila
    }
    
    
    func obtenerReceta(receta: RecetaModel) {
        recetas.append(receta)
        //emisor.dismiss(animated: true)
        navigationController?.popViewController(animated: true)
        actualizaResumen()
    }
    
    // Definir estilos que aparecen al hacer slide en una fila
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //
        if editingStyle == .delete {
            recetas.remove(at: indexPath.row)
            tablaRecetas.reloadData()
        }
    }
    
    // Variables para la vista
    @IBOutlet weak var tablaRecetas: UITableView!
    // Variables para la lógica
    var recetas: [RecetaModel] = []
    
    // Comprobar qué segue se está activando (a qué ventana va)
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tablaRecetas.delegate = self
        tablaRecetas.dataSource = self
        // Llamar a la func
        actualizaResumen()
    }
    
    // Func contar contactos del array
    func actualizaResumen() {
        tablaRecetas.reloadData()
    }
    
    // Comprobar qué segue se está activando (a qué ventana vas)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "VerReceta":
            // Cuando ya tengo el contacto accedo al destino
            let receta = recetas[tablaRecetas.indexPathForSelectedRow!.row]
            let destino = segue.destination as! VerRecetaViewController
            destino.receta = receta
        case "AddReceta":
            let destino = segue.destination as! AddRecetaViewController
            destino.delegate = self
        /*case "AddIngredientes":
            let ingrediente = recetas[tabla.indexPathSelectedRow!.row].ingredientes[0]
            let destino = segue.destination as! AddIngredientesViewController
            destino.delegate = self*/
        default:
            print("HOLA")
        }
    }
}

