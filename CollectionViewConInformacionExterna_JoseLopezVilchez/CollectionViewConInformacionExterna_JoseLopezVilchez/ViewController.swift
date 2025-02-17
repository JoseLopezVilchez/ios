//
//  ViewController.swift
//  CollectionViewConInformacionExterna_JoseLopezVilchez
//
//  Created by dam2 on 9/1/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, PasoAtras {
    
    /*
     1. Crear una aplicación que muestre un CollectionView (5 pts).
     Se deberá configurar un icono para la app y una pantalla de carga con al menos una imagen (5 pts).
     Descargar la información de los personajes de Rick and Morty de esta API: https://rickandmortyapi.com/
     2. Mostrar en cada celda la imagen del personaje, su nombre y su especie. 20 pts.
     3. Al hacer clic en una celda se debe mostrar otra pantalla indicando: nombre, imagen, especie, estado, género, origen y localización. 20 pts.
     4. Las diferentes vistas se muestran correctamente en todos los tamaños de pantalla en horizontal y vertical. 10 pts.
     5. Mostrar una tabla con un listado de episodios donde aparece el personaje. Este listado debe aparecer en la pantalla del punto 3. 20 pts.
     6. Al seleccionar un episodio se mostrarán todos los personajes que aparecen en ese episodio en un collection view o table view (se puede reutilizar el que ya tenemos) 20 pts.
     */
    @IBOutlet weak var collectionView: UICollectionView!
    
    var charData : Api<Character>?;
    let defaultUrl = "https://rickandmortyapi.com/api/character";
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil);
    
    lazy var pantallaPersonaje: CharacterViewController = {
        return storyBoard.instantiateViewController(withIdentifier: "characterViewController") as! CharacterViewController;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        loadApi(from: defaultUrl, as: Api<Character>.self, do: { data in
            self.charData = data;
            self.collectionView.reloadData();
        });
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let listado = charData?.results {
            return listado.count;
        } else {
            return 0;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! Celda;
        
        if let resultado = charData?.results[indexPath.item] {
            
            cell.nombreCelda.text = resultado.name;
            cell.especieCelda.text = resultado.species;
            
            loadImage(from: resultado.image) { image in
                // Verificar si la celda sigue visible y pertenece al índice correcto
                guard let currentIndex = collectionView.indexPath(for: cell), currentIndex == indexPath else { return };
                cell.imagenCelda.image = image;
            }
        }
        
        return cell;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let envio = charData?.results[indexPath.item] else { return };
        pantallaPersonaje.datos = (nombre : envio.name, especie : envio.species, estado : envio.status, genero : envio.gender, origen : envio.origin.name, localizacion : envio.location.name, listado : envio.episodes, imagen : envio.image);
        pantallaPersonaje.instancia = self;
        self.present(pantallaPersonaje, animated : true);
        pantallaPersonaje.rellenarInfo();
    }
    
    func pasoAtras(datos : [Character]) {
        charData?.results = datos;
        collectionView.reloadData();
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnas: CGFloat = 2;
        let collectionViewWidth = collectionView.bounds.width;
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout;
        let espacioEntreCeldas = flowLayout.minimumInteritemSpacing * (columnas - 1);
        let adjustedWidth = collectionViewWidth - espacioEntreCeldas;
        let width: CGFloat = adjustedWidth / columnas;
        let height: CGFloat = width;
        return CGSize(width: width, height: height);
    }
}
