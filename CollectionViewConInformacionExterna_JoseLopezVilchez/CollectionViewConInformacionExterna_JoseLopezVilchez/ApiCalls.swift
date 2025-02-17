//
//  ApiCalls.swift
//  CollectionViewConInformacionExterna_JoseLopezVilchez
//
//  Created by dam2 on 23/1/25.
//

import UIKit

func loadData<T : Codable> (from urlStr : String, as type : T.Type, do clojure : @escaping (T) -> Void) {
    
    guard let url = URL(string: urlStr) else {
        print ("Url \(urlStr) invalida");
        return;
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print ("Algo ha ido mal: \(error)");
            return;
        }
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            print("Error HTTP: \(httpResponse.statusCode)");
            return;
        }
        
        guard let data = data else {
            print("No se recibieron datos");
            return;
        }
        
        let decoder = JSONDecoder();
        do {
            let api = try decoder.decode(type, from: data)
            DispatchQueue.main.async {
                clojure(api);
            }
        } catch {
            print("Error al decodificar JSON: \(error.localizedDescription)")
        }
    }
    
    task.resume();
}

func urlIdsGetter (urls : [String]) -> String {
    
    var patron : [String] = [];
    
    do {
        let regex = try Regex("\\d+$");
        
        urls.forEach{patron.append(String($0.firstMatch(of: regex)?.0 ?? ""))};

    } catch {
        print("Error al crear la expresión regular: \(error)")
    }
    
    return patron.joined(separator: ",");
}

func loadApi<T : Codable> (from urlStr : String, as type : Api<T>.Type, do clojure : @escaping (Api<T>) -> Void) {
    loadData(from: urlStr, as: type, do: clojure);
}

func loadLocation (from urlStr : String, do clojure : @escaping (Location) -> Void) {
    loadData(from: urlStr, as: Location.self, do: clojure);
}

func loadLocationArray (from urlList : [String], do clojure : @escaping ([Location]) -> Void) {
    loadData(from: "https://rickandmortyapi.com/api/location/\(urlIdsGetter(urls: urlList))", as: [Location].self, do: clojure);
}

func loadCharacter (from urlStr : String, do clojure : @escaping (Character) -> Void) {
    loadData(from: urlStr, as: Character.self, do: clojure);
}

func loadCharacterArray (from urlList : [String], do clojure : @escaping ([Character]) -> Void) {
    loadData(from: "https://rickandmortyapi.com/api/character/\(urlIdsGetter(urls: urlList))", as: [Character].self, do: clojure);
}

func loadEpisode (from urlStr : String, do clojure : @escaping (Episode) -> Void) {
    loadData(from: urlStr, as: Episode.self, do: clojure);
}

func loadEpisodeArray (from urlList : [String], do clojure : @escaping ([Episode]) -> Void) {
    loadData(from: "https://rickandmortyapi.com/api/episode/\(urlIdsGetter(urls: urlList))", as: [Episode].self, do: clojure);
}

func loadImage(from urlStr: String, completion : @escaping (UIImage?) -> Void) { //UIImage no es codable asi que toca meterle el tocho de codigo
    
    guard let url = URL(string: urlStr) else {
        print ("Url \(urlStr) invalida");
        return;
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data, let image = UIImage(data: data) {
            DispatchQueue.main.async {
                completion(image);
            }
        } else {
            DispatchQueue.main.async {
                completion(nil);
            }
        }
    }
    task.resume()
}
