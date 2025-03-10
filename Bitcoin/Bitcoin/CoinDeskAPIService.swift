//
//  CoinDesk.swift
//  Bitcoin
//
//  Created by dam2 on 6/3/25.
//

import Foundation
import Combine

struct CoinDeskAPIService {
    public static let shared : CoinDeskAPIService = CoinDeskAPIService() //instancia compartida de API service
    
    public func fetchBitcoinPrice () -> AnyPublisher<APIResponse, Error> {
        
        guard let url = URL(string: "https://test3.qastusoft.com.es/bitcoinprice.json") else {
            let error = URLError(.badURL);
            return Fail(error: error).eraseToAnyPublisher(); //envolvemos el fail en un publisher con este método
        }
        
        return URLSession.shared.dataTaskPublisher(for: url) //dataTaskPublisher devuelve un data y un response
            .tryMap { data, response in
                //comprobamos formato de response
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.unknown);
                }
                
                //comprobamos codigo de respuesta
                guard httpResponse.statusCode == 200 else {
                    let code = URLError.Code(rawValue: httpResponse.statusCode);
                    throw URLError(code);
                }
                
                return data;
            }
            .decode(type: APIResponse.self, decoder: JSONDecoder()) //decodifica json
            .receive(on: DispatchQueue.main) //recibimos datos del hilo principal
            .eraseToAnyPublisher(); //envolvemos apiresponse en anypublisher
        
    }
}
