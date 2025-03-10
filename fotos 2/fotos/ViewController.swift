//
//  ViewController.swift
//  fotos
//
//  Created by mac-profesor on 6/2/25.
//

import UIKit
import PhotosUI

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fotoBtn(_ sender: Any) {
    }
    
    @IBAction func galeryBtn(_ sender: Any) {
        self.configureImagePicker()
    }
    
    @IBAction func guardarBtn(_ sender: Any) {
    }
    
    
    func configureImagePicker(){
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1 //Default = 1 //Ilimitado = 0
        configuration.filter = .images
        
        let pickerViewController = PHPickerViewController(configuration: configuration)
        pickerViewController.delegate = self
        present(pickerViewController, animated: true)
    }
    
}

extension ViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        if let itemProvider = results.first?.itemProvider{
            if itemProvider.canLoadObject(ofClass: UIImage.self){ //El objeto es una imagen?
                itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    
                    if let error {
                        print(error)
                    }
                    
                    if let selectedImage = image as? UIImage{
                        DispatchQueue.main.async {
                            self.imageView.image = selectedImage
                        }
                    }
                }
            }
        }
    }
    
    
}
