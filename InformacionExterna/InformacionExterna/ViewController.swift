//
//  ViewController.swift
//  InformacionExterna
//
//  Created by dam2 on 3/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadData();
    }
    
    //Petición GET con respuesta en texto plano
    /*func downloadData () {
        
        let urlstring = "https://qastusoft.com.es/apis/frase.php";
        
        //Crea instancia de clase URL
        guard let url = URL(string : urlstring) else {return};
        
        //Crea petición asíncrona
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //Manejamos respuesta
            //Compruebo si se produce un error
            if (error != nil) {
                print (error!.localizedDescription);
            }
            
            //Compruebo respuesta
            if let response = response as? HTTPURLResponse {
                print (response);
                if (response.statusCode == 200) { //Nota: 200 -> ok
                    
                }
            }
            
            //Manejar los datos
            guard let data = data else {return};
            
            let str = String(decoding: data, as: UTF8.self);
            
            print (str);
            
            //Volvemos a la hebra principal para modificar el texto de label
            DispatchQueue.main.async {
                //Todo este bloque de código se ejecuta en el hilo principal
                self.label.text = str;
            }
            
        }.resume(); //Resume es lo que lanza la petición a la url
        
    }*/
    
    //Petición GET con respuesta en JSON
    /*func downloadData (){
        
        let urlstring = "https://qastusoft.com.es/apis/frase.php?centro=estech";
        
        guard let url = URL(string : urlstring) else {return};
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                
            if (error != nil) {
                print (error!.localizedDescription);
            }
            
            if let response = response as? HTTPURLResponse {
                //Imprime el código de la respuesta http
                print ("Response code: \(response.statusCode)");
            }
            
            guard let data = data else {return};
            
            //Manejamos los datos en JSON
            do {
                /*let json = try JSONSerialization.jsonObject(with: data) as! [String : Any]; //Normalmente se haría una clase en base a la respuesta del json, pero en este caso metemos los datos en un array asociativo
                
                DispatchQueue.main.async {
                    self.label.text = json["name"] as? String; //Hace falta este casting por haber usado el asociativo string - any, y hay que convertir el any a algo antes de usarlo
                }*/
                
                //Este ejemplo mete los datos del json en un modelo (un struct) llamado FraseModel
                let json = try JSONDecoder().decode(FraseModel.self, from: data);
                DispatchQueue.main.async {
                    self.label.text = json.name;
                }
                
            } catch let jsonError {
                print (jsonError);
            }
            
        }.resume(); //OJO A ESTO, NO SE TE OLVIDE - O LO PONES O NO HACE NADA
    }*/
    
    /*func downloadData () async -> FraseModel {
        
        let url = URL(string: "https://qastusoft.com.es/apis/frase.php?centro=estech")!;
        
        let (data, _) = try! await URLSession.shared.data(from: url);
     
        let jsonDecoder = JSONDECODER();
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase; //Esto es para cambiar estrategias de decodificacion (camelcase, snake_case, etc)
        
        return try! jsonDecoder.decode(FraseModel.self, from: data);
        
    }
    
    func downloadData2 () {
        
        print("Se va a lanzar la petición");
        
        Task {
            let respuesta = await downloadData();
        }
        
    }*/
    
    //Petición POST
    func downloadData () {
        
        let url = String(format: "https://qastusoft.com.es/apis/login.php");
        
        guard let serviceUrl = URL(string: url) else { return };
        
        //Definimos peticion
        var request = URLRequest(url: serviceUrl);
        request.httpMethod = "POST";
        request.setValue("Application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type");
        
        //Añadir los parámetros
        let bodyData = "user=Alfonso&pass=Alfonso.";
        request.httpBody = bodyData.data(using: String.Encoding.utf8);
        
        //Realizamos la peticion
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let response = response as? HTTPURLResponse {
                print ("Código: \(response.statusCode)");
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data);
                } catch {
                    print(error);
                }
            }
            
        }.resume()
        
    }

}

