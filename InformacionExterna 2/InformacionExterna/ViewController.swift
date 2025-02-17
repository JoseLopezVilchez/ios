//
//  ViewController.swift
//  InformacionExterna
//
//  Created by mac-profesor on 3/12/24.
//

import UIKit

class ViewController: UIViewController, PasarDatosPatras {
    
    @IBOutlet weak var miLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadData2()
        
    }
    
    
    func recibirDatos(_ texto: String) {
        miLabel.text = texto
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc2 = segue.destination as! ViewController2
        vc2.delegate = self
    }
    
    
//    //Petición GET con respuesta en texto plano
//    func downloadData(){
//        let urlString = "https://qastusoft.com.es/apis/frase.php"
//        //Crear una instancia de URL
//        guard let url = URL(string: urlString) else { return }
//        
//        //Crear la petición asíncrona
//        URLSession.shared.dataTask(with: url){ (data, response, error) in
//            //Manejamos la respuesta
//            
//            //Comprobar si se produjo un error
//            if error != nil{
//                print(error!.localizedDescription)
//            }
//            
//            //Comprobar la respuesta del servidor
//            if let response = response as? HTTPURLResponse {
//                print(response)
////                if response.statusCode == 200
//            }
//            
//            //Manejar los datos
//            guard let data = data else { return }
//            
//            let str = String(decoding: data, as: UTF8.self)
//            
//            print(str)
//            
//            //Volvemos a la hebra principal para modificar el texto del label
//            DispatchQueue.main.async {
//                //este bloque de código se ejecuta en el hilo principal
//                self.miLabel.text = str
//            }
//            
//            
//        }.resume()
//    }
    
    
    
    //Petición GET con respuesta en JSON
//    func downloadData(){
//        let urlString = "https://qastusoft.com.es/apis/frase.php?centro=estech"
//        guard let url = URL(string: urlString) else { return }
//        
//        URLSession.shared.dataTask(with: url){ (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//            
//            if let response = response as? HTTPURLResponse {
//                //Imprimimos el código de la respuesta http
//                print("Response code: \(response.statusCode)")
//            }
//            
//            guard let data = data else { return }
//            
//            //Manejamos los datos en JSON
//            
//            do {
//                let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
//                DispatchQueue.main.async {
//                    self.miLabel.text = json["name"] as? String
//                }
//                
//            }catch let jsonError {
//                print(jsonError)
//            }
//            
//            
//        }.resume()
//    }

    
    //Utilizando un modelo
//    func downloadData(){
//        let urlString = "https://qastusoft.com.es/apis/frase.php?centro=estech"
//        guard let url = URL(string: urlString) else { return }
//        
//        URLSession.shared.dataTask(with: url){ (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//            
//            if let response = response as? HTTPURLResponse {
//                //Imprimimos el código de la respuesta http
//                print("Response code: \(response.statusCode)")
//            }
//            
//            guard let data = data else { return }
//            
//            //Decodificamos el JSON utilizando el modelo FraseModel
//            
//            do {
//                let jsonDecoder = JSONDecoder()
//                let fm = try jsonDecoder.decode(FraseModel.self, from: data)
//                
//                DispatchQueue.main.async {
//                    self.miLabel.text = fm.name
//                }
//                
//            }catch let jsonError {
//                print(jsonError)
//            }
//            
//            
//        }.resume()
//    }
    
    
    func downloadData2() {
        print("Se va a lanzar la petición")
        Task {
            let respuesta = await downloadData()
            print("se ha recibido la respuesta")
            print(respuesta)
        }
        print("Se ha enviado la petición")
        
        
    }
    
    func downloadData() async -> FraseModel {

        let url = URL(string: "https://qastusoft.com.es/apis/frase.php?centro=estech")!
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(FraseModel.self, from: data)
        
    }
    
    
//    //Petición POST
//    func downloadData(){
//        let url = String(format: "https://qastusoft.com.es/apis/login.php")
//        guard let serviceUrl = URL(string: url) else {return}
//        
//        //Definimos y configuramos la petición
//        var request = URLRequest(url: serviceUrl)
//        request.httpMethod = "POST"
//        request.setValue("Application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        
//        //Añadir los parámetros
//        let bodyData = "user=Alfonso&pass=Alfonso."
//        request.httpBody = bodyData.data(using: String.Encoding.utf8)
//        
//        //Realizamos la petición
//        URLSession.shared.dataTask(with: request){ (data, response, error) in
//            if let response = response as? HTTPURLResponse {
//                print("Response code: \(response.statusCode)")
//            }
//
//            if let data = data {
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data)
//                    print(json)
//                }catch {
//                    print(error)
//                }
//            }
//        }.resume()
//    }


}

