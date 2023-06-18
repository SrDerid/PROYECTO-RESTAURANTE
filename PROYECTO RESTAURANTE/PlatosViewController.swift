//
//  PlatosViewController.swift
//  PROYECTO RESTAURANTE
//
//  Created by Nefi Alvarado on 10/06/23.
//  Copyright © 2023 CibertecTeam. All rights reserved.
//

import FirebaseFirestore
import UIKit

struct Plato {
    let imagen : String
    let nombre : String
    let precio : String
    
    
}

class PlatosViewController: UIViewController , UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{
    
    let database = Firestore.firestore()

    @IBOutlet weak var PlatosCollection: UICollectionView!
    var platosList : [Plato] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlatosCollection.dataSource = self // le asignamos su delegado BibliotecaViewController
        PlatosCollection.delegate = self
        loadData()        // Do any additional setup after loading the view.
    }
    
    //Numeros de elementos que se mostraran en el UICOllectionView
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return platosList.count // numero de elementos de la lista
       }
       
       //Los daros a mostrar enb cada celda del UiCollectionView
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           //Identifico el prototipo de celda qeu se usara por medio de su identificador
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemPlatillo", for: indexPath) as!
           PlatosCollectionViewCell
           
           //Obtengo el obejto con los datos a mostrar usando la lista
           let plato = platosList[indexPath.row]
           
           //asignamos el valor del nombre libro label
           cell.nombreLabel.text = plato.nombre
           cell.precioLabel.text = plato.precio
           //asignamos ek valor del nombre de libro al label
           cell.imagenView.image = UIImage(named: plato.imagen)
           return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let with = (collectionView.frame.width - 80) / 4
        return CGSize(width: with, height: 215)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 15)
    }
    
    //Prueba 2
    
    func loadData (){
        platosList.append(Plato(imagen: "img1", nombre: "Arroz con Pollo", precio: "27.50"))
        platosList.append(Plato(imagen: "img2", nombre: "Arroz con Mariscos", precio: "24.50"))
        platosList.append(Plato(imagen: "img3", nombre: "Lomo Fino Saltado", precio: "33.90"))
        platosList.append(Plato(imagen: "img4", nombre: "Aji de Gallina", precio: "22.70"))
        platosList.append(Plato(imagen: "img5", nombre: "Ceviche de Tollo", precio: "25.50"))
        platosList.append(Plato(imagen: "img6", nombre: "Aguadito", precio: "20.50"))
        
    }
    
    
    
    
    
    

}
