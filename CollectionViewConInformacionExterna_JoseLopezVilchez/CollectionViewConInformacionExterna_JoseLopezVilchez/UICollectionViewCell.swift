//
//  UI.swift
//  CollectionViewConInformacionExterna_JoseLopezVilchez
//
//  Created by dam2 on 17/1/25.
//

import UIKit

class Celda : UICollectionViewCell {
    
    @IBOutlet weak var imagenCelda: UIImageView!
    @IBOutlet weak var nombreCelda: UILabel!
    @IBOutlet weak var especieCelda: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib();
    }
    
}
