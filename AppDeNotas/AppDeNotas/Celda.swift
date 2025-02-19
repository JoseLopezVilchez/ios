//
//  Celda.swift
//  AppDeNotas
//
//  Created by dam2 on 17/2/25.
//

import UIKit
import CoreData

class Celda : UITableViewCell {
    
    @IBOutlet weak var texto: UITextField!
    
    var viewController : ViewController? = nil;
    var posicion = 0;
    
    override func awakeFromNib() {
        super.awakeFromNib();
        
        texto.delegate = self;
    }
    
    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
    }*/
    
    
}

extension Celda : UITextFieldDelegate {    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let texto = textField.text else { return }
        viewController?.rewriteNote(title: texto, posicion: posicion);
    }
}

protocol RewriteNote {
    func rewriteNote (title : String, posicion : Int)
}
