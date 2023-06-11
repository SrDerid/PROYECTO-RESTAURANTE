import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonLogin.layer.cornerRadius = 10
        
        buttonLogin.clipsToBounds = true
        
    }
    
    @IBAction func mostrarLoginForm(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginForm") as! LoginFormViewController
        
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    


}
