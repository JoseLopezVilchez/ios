//
//  Celda.swift
//  TablaCiudadesConFiltroYOpcionDeCompartir_JoseLopezVilchez
//
//  Created by dam2 on 17/12/24.
//

import UIKit

class Celda : UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
    }
}
