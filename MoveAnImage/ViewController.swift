import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var blackBox: UIImageView!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputAge: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    
    var firstToSecondSegue: String = "firstToSecondSegue"
    
    var name: String?
    var age: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onDrag(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        if let viewToPan = sender.view {
            viewToPan.center = CGPoint(x: viewToPan.center.x + translation.x, y: viewToPan.center.y + translation.y)
            
            if blackBox.frame.intersects(viewToPan.frame) {
                performSegue(withIdentifier: firstToSecondSegue, sender: self)
            }
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == firstToSecondSegue {
            let destinationVC = segue.destination as! SecondViewController
            
            name = inputName.text
            age = inputAge.text
            email = inputEmail.text
            
            destinationVC.receivingName = name
            destinationVC.receivingAge = age
            destinationVC.receivingEmail = email
        }
    }
    
}

