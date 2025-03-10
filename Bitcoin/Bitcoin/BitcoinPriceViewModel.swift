//
//  BitcoinPriceViewModel.swift
//  Bitcoin
//
//  Created by dam2 on 6/3/25.
//

import Combine

class BitcoinPriceViewModel : ObservableObject {
    
    @Published public private(set) var lastUpdated : String = ""; //hace que solo esta clase pueda cambiar el valor
    @Published public private(set) var priceDetails : [PriceDetails] = Currency.allCases.map {
        PriceDetails(currency: $0);
    };
    
    //creamos una suscripción a nuestro publisher
    private var subscription : AnyCancellable?; //suscripción cancelable
    
    public func onAppear () {
        
        //obtener los datos de api
        subscription = CoinDeskAPIService.shared.fetchBitcoinPrice()
            .sink { completion in
                //el completion solo puede devolver o .failure o .finish
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Éxito")
                }
            } receiveValue: { [weak self] value in //[weak self] captura el entorno del clojure
                guard let self = self else { return }
                self.lastUpdated = value.time.updated
                self.priceDetails = [
                    PriceDetails(currency: .usd, rate: value.bpi.USD.rate),
                    PriceDetails(currency: .gbp, rate: value.bpi.GBP.rate),
                    PriceDetails(currency: .eur, rate: value.bpi.EUR.rate)
                ];
            }
        
    }
}
