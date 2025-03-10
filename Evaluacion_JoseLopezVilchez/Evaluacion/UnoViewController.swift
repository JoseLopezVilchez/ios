//
//  ViewController.swift
//  Examen_240208
//
//  Created by Alfonso Marín on 7/2/24.
//

import UIKit

class UnoViewController: UIViewController {

    //@IBOutlet weak var image: UIImageView!//la he dejado comentada porque no venía asociada a ninguna imagen
    
    @IBOutlet weak var gatoImg: UIImageView!
    @IBOutlet weak var magoImg: UIImageView!
    @IBOutlet weak var pikaImg: UIImageView!
    @IBOutlet weak var linkImg: UIImageView!
    
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gatoImg.isUserInteractionEnabled = true;
        magoImg.isUserInteractionEnabled = true;
        pikaImg.isUserInteractionEnabled = true;
        linkImg.isUserInteractionEnabled = true;

        gatoImg.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.saveGato(_:)))
        );
        magoImg.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.saveMago(_:)))
        );
        pikaImg.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.savePika(_:)))
        );
        linkImg.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.saveLink(_:)))
        );
    }
    
    @objc func saveGato (_ sender: UITapGestureRecognizer) {
        saveImg(origen: gatoImg);
    }
    
    @objc func saveMago (_ sender: UITapGestureRecognizer) {
        saveImg(origen: magoImg);
    }
    
    @objc func savePika (_ sender: UITapGestureRecognizer) {
        saveImg(origen: pikaImg);
    }
    
    @objc func saveLink (_ sender: UITapGestureRecognizer) {
        saveImg(origen: linkImg);
    }
    
    func saveImg (origen : UIImageView) {
        if let imagen = origen.image {
            
            let pantallaAlerta : UIAlertController = UIAlertController(
                title: "Guardando",
                message: "¿Desea guardar la imagen?",
                preferredStyle: UIAlertController.Style.alert
            );
            
            pantallaAlerta.addAction(UIAlertAction(
                
                title: "Aceptar",
                style: .default,
                handler: { (action) in
                    UIImageWriteToSavedPhotosAlbum(imagen, self, #selector(self.image(_: didFinishSavingWithError:contextInfo:)), nil);
                }
                
            ));
            pantallaAlerta.addAction(UIAlertAction(
                
                title: "Cancelar",
                style: .cancel

            ));
            
            self.present(pantallaAlerta, animated: true);
            
        } else {
            print("No se ha podido guardar");
        }
    }
    
    @objc func image (_ image : UIImage, didFinishSavingWithError error : NSError?, contextInfo : UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Error al guardar la imagen", message: error.localizedDescription, preferredStyle: .alert);
            present(ac, animated: true);
        } else {
            let ac = UIAlertController(title: "Imagen guardada", message: "La imagen se ha guardado en el carrete", preferredStyle: .alert);
            
            ac.addAction(UIAlertAction(
                
                title: "Pues vale",
                style: .cancel

            ));
            
            present(ac, animated: true);
        }
    }

}
