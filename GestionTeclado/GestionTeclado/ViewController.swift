//
//  ViewController.swift
//  GestionTeclado
//
//  Created by dam2 on 16/1/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var primerTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //mete listener al crear vista
        self.keyboardWhenTappedAround();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reactiva listener al volver a la vista
        self.keyboardWhenTappedAround();
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil);
        self.definirDelegadosDeTextFields();
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        //desactiva listener al salir de vista
        NotificationCenter.default.removeObserver(self);
    }
    
    @objc func keyboardWillShow (notification : NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if let seleccionado = view.selectedTextField {
                let finalDelTextField = seleccionado.frame.origin.y + seleccionado.frame.height;
                let inicioTeclado = UIScreen.main.bounds.size.height - keyboardSize.height
                if (finalDelTextField > inicioTeclado - 100 && self.view.frame.origin.y == 0) { //el 100 es por darle margen, por si queda el teclado muy justo pegado al text input. Queda mas bonito subirlo igualmente
                    self.view.frame.origin.y -= keyboardSize.height;
                }
            };
        }
    }
    
    @objc func keyboardWillHide () {
        if (self.view.frame.origin.y != 0) {
            self.view.frame.origin.y = 0;
        }
    }
}

extension UIViewController {
    func keyboardWhenTappedAround () {
        //definir el gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard));
        
        //añade el gesture recognizer
        view.addGestureRecognizer(tap);
    }
    
    @objc func dismissKeyboard () {
        view.endEditing(true);
    }
}

extension UIView {
    //array con todos los TextField contenidos en la vista
    var textFieldsInView : [UITextField] {
        return subviews
            .filter({$0 is UITextField})
            .reduce(subviews.compactMap{ $0 as? UITextField }, {sum, current in
                return sum + current.textFieldsInView;
            });
    }
    
    var selectedTextField : UITextField? {
        return textFieldsInView.filter { $0.isFirstResponder }.first;
    }
}

extension ViewController : UITextFieldDelegate {
    
    func definirDelegadosDeTextFields () {
        view.textFieldsInView.forEach{$0.delegate = self};
    }
    
    //Pasar al siguiente text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1;
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder();
        } else {
            textField.resignFirstResponder();
        }
        
        return true;
    }
}
