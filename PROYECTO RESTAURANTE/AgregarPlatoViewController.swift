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
    
    let db = Firestore.firestore()
    var num: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func guardarPlato(_ sender: Any) {
        
        view.endEditing(true)
        
        
        let plato = "plato" + String(num)
        
        
        db.collection("restaurante").document(plato).setData([
            "nombre": nombreTextField.text as Any,
            "precio": precioTextField.text ?? "",
            "imagen": ""
        ])
        
        num += 1
        
        
        
    }
    

}
