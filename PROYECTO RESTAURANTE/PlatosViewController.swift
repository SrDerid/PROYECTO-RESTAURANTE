//
//  PlatosViewController.swift
//  PROYECTO RESTAURANTE
//
//  Created by Nefi Alvarado on 10/06/23.
//  Copyright © 2023 CibertecTeam. All rights reserved.
//

import FirebaseFirestore
import UIKit
import FirebaseAuth

struct Plato {
    let id : String
    let imagen : String
    let nombre : String
    let precio : String
    
    
}

class PlatosViewController: UIViewController , UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{
    
    let db = Firestore.firestore()

    @IBOutlet weak var PlatosCollection: UICollectionView!
    var platosList : [Plato] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlatosCollection.dataSource = self // le asignamos su delegado BibliotecaViewController
        PlatosCollection.delegate = self
        self.obtenerPlatos()
       // loadData()        // Do any additional setup after loading the view.
    }
    
    @IBAction func cerrarSesionButton(_ sender: Any) {
        
            
        do {
            try Auth.auth().signOut()
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "principalView") as! LoginViewController
            
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        } catch  {
            //Se ha producido un error
        }
        
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
        
            let imageUrl = URL(string: plato.imagen)
        
           //asignamos el valor del nombre plato label
           cell.nombreLabel.text = plato.nombre
           cell.precioLabel.text = plato.precio
           //asignamos el url de imagen
            cell.imagenView.load(url: imageUrl!)
        
           return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let with = (collectionView.frame.width - 50) / 4
        return CGSize(width: with, height: 215)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 15)
    }
    
    //Prueba 2
    
    func loadData (){
        platosList.append(Plato(id: "",imagen: "img1", nombre: "Arroz con Pollo", precio: "27.50"))
        platosList.append(Plato(id: "",imagen: "img2", nombre: "Arroz con Mariscos", precio: "24.50"))
        platosList.append(Plato(id: "",imagen: "img3", nombre: "Lomo Fino Saltado", precio: "33.90"))
        platosList.append(Plato(id: "",imagen: "img4", nombre: "Aji de Gallina", precio: "22.70"))
        platosList.append(Plato(id: "",imagen: "img5", nombre: "Ceviche de Tollo", precio: "25.50"))
        platosList.append(Plato(id: "",imagen: "img6", nombre: "Aguadito", precio: "20.50"))
        
    }
    
    
    
    
    
    

}
//FIREBASE
extension PlatosViewController{
    
    func obtenerPlatos(){
        let db = Firestore.firestore()
        db.collection("restaurante").getDocuments(){(query, error) in
            if let error = error{
                print("Se presentò un error \(error)")
                }else{
                        for document in query!.documents{
                            let id = document.documentID
                            let data = document.data()
                            
                            let nombre = data["nombre"] as? String ?? ""
                            let precio = data["precio"] as? String ?? ""
                            let imagen = data["imagen"] as? String ?? ""
                            
                            let platos = Plato(id: id,imagen: imagen, nombre: nombre, precio: precio)
                            
                            self.platosList.append(platos)
                            
                        }
                    }
                   // self.librosTableView.reloadData()
                    self.PlatosCollection.reloadData()
                }
            }
        }
    
extension UIImageView{
    func load(url:URL){
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

