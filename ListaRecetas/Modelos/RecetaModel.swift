//
//  RecetaModel.swift
//  ListaRecetas
//
//  Created by Marcos Ledesma on 26/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

class RecetaModel: NSObject {
    // Atributos de la Receta
    var nombre: String
    var descripcion: String
    var tiempoCoccion: Int
    var ingredientes: [String]? // Opcional
    
    // Para no crear los atributos opcionales (String?) creamos el inicializador (init)
    init(nombre: String, descripcion: String, tiempoCoccion: Int, ingredientes: [String]?) {
        self.nombre = nombre
        self.descripcion = descripcion
        self.tiempoCoccion = tiempoCoccion
        self.ingredientes = ingredientes
    }
    
}
