//
//  ViewController.swift
//  Fotos
//
//  Created by dam2 on 6/2/25.
//

import UIKit;
import PhotosUI;

class ViewController: UIViewController, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imagen: UIImageView!;
    
    var imagePicker : UIImagePickerController!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnFoto(_ sender: Any) {
        imagePicker = UIImagePickerController();
        imagePicker.delegate = self;
        imagePicker.sourceType = .camera;
        imagePicker.allowsEditing = true; //por defecto viene en falso, y permite escalar y modificar un poco la imagen
        imagePicker.showsCameraControls = true; //por defecto viene en falso
        imagePicker.cameraCaptureMode = UIImagePickerController.CameraCaptureMode.photo;
        
        present(imagePicker, animated: true);
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true);
        imagen.image = info[.editedImage] as? UIImage;
    }
    
    
    @IBAction func btnGaleria(_ sender: Any) {
        self.configureImagePicker();
    }
    
    
    @IBAction func btnGuardar(_ sender: Any) {
        if let imagen = self.imagen.image {
            UIImageWriteToSavedPhotosAlbum(imagen, self, #selector(image(_: didFinishSavingWithError:contextInfo:)), nil);
        } else {
            print ("Se debe seleccionar una imagen previamente");
        }
    }
    
    @objc func image (_ image : UIImage, didFinishSavingWithError error : NSError?, contextInfo : UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Error al guardar la imagen", message: error.localizedDescription, preferredStyle: .alert);
            present(ac, animated: true);
        } else {
            let ac = UIAlertController(title: "Imagen guardada", message: "La imagen se ha guardado en el carrete", preferredStyle: .alert);
            present(ac, animated: true);
        }
    }
    
    func configureImagePicker () {
        var config = PHPickerConfiguration();
        config.selectionLimit = 1; //determina el numero maximo que se pueden seleccionar de la galeria. Por defecto es 1. Para hacerlo ilimitado, pon 0
        config.filter = .images; //determina el tipo de foto
        
        
        let pickerViewController = PHPickerViewController(configuration: config);
        pickerViewController.delegate = self;
        present(pickerViewController, animated: true);
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true);
        
        
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            
            itemProvider.loadObject(ofClass: UIImage.self) { image , error in
                if let error {
                    print(error);
                }
                
                if let selectedImage = image as? UIImage {
                    DispatchQueue.main.async {
                        self.imagen.image = selectedImage;
                    }
                }
            };
        }
    }
    
}

