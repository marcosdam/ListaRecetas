//
//  RecetaTableViewCell.swift
//  ListaRecetas
//
//  Created by Marcos Ledesma on 26/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

class RecetaTableViewCell: UITableViewCell {
    // label para el nombre de la receta
    @IBOutlet weak var lblRecetaCelda: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
