import UIKit
import FirebaseAuth


class LoginFormViewController: UIViewController {

    @IBOutlet weak var buttonEntrar: UIButton!
    
    @IBOutlet weak var textCorreo: UITextField!
    
    @IBOutlet weak var textClave: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonEntrar.layer.cornerRadius = 15
        buttonEntrar.clipsToBounds = true
    }
    
    @IBAction func verificarLogin(_ sender: Any) {
       let correo = textCorreo.text!
        let clave = textClave.text!
       
        Auth.auth().signIn(withEmail: correo, password: clave){ authResult, error in
            if let user = authResult {
                //login correcto
                print(user.user.uid)
                self.goToMain()
            }else{
                //login error
            }
            
        }
        
    }
    
     func goToMain(){
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let viewController = storyBoard.instantiateViewController(withIdentifier: "MenuTabBar") as! MenuTabBarController
               
               viewController.modalPresentationStyle = .fullScreen
               self.present(viewController, animated: true, completion: nil)
        
    }

    
    
    
    
    
}
