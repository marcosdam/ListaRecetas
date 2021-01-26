//
//  IngredienteTableViewCell.swift
//  ListaRecetas
//
//  Created by Marcos Ledesma on 26/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

class IngredienteTableViewCell: UITableViewCell {
    // label para el nombre del ingrediente
    @IBOutlet weak var lblIngredienteCelda: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblIngredienteCelda.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
