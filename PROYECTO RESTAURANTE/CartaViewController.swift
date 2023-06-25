//
//  CartaViewController.swift
//  PROYECTO RESTAURANTE
//
//  Created by jean carlos on 24/06/23.
//  Copyright © 2023 CibertecTeam. All rights reserved.
//

import UIKit
import FirebaseAuth

class CartaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cerrarSesion(_ sender: Any) {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
