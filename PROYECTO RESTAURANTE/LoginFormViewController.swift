import UIKit

class LoginFormViewController: UIViewController {

    @IBOutlet weak var buttonEntrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonEntrar.layer.cornerRadius = 15
        buttonEntrar.clipsToBounds = true
    }
    
    @IBAction func verificarLogin(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "MenuTabBar") as! MenuTabBarController
        
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    
    
}
