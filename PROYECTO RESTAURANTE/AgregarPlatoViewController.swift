//
//  AgregarPlatoViewController.swift
//  PROYECTO RESTAURANTE
//
//  Created by jean carlos on 18/06/23.
//  Copyright © 2023 CibertecTeam. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AgregarPlatoViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var precioTextField: UITextField!
    
    @IBOutlet weak var imagenTextField: UITextField!
    
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func guardarPlato(_ sender: Any) {
        
        view.endEditing(true)
        var plato = ""
        
       // Contar las colecciones
       db.collection("restaurante").getDocuments { (query, error) in
           if let error = error {
               print("Error al obtener las colecciones \(error)")
           } else {
               // Obtener el número de colecciones
               let count = query?.documents.count ?? 0
               plato = "plato\(count + 1)"

            self.db.collection("restaurante").document(plato).setData([
                "nombre": self.nombreTextField.text as Any,
                "precio": self.precioTextField.text ?? "",
                "imagen": self.imagenTextField.text ?? ""
               ])
           }
       }
        
        
    }
    

}
