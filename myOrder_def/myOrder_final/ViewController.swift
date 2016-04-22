
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailFromUser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.emailFromUser.text)
    
        
        // Zorgt ervoor dat keyboard (inputfield) verdwijnt wanneer gebruiker ergens anders in view tapt
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() { //
        // Eind
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) { // Stuur tafelnummer door naar Products controller
        if (segue.identifier == "segueEmail") {
            let svc = segue.destinationViewController as! SelectTableController;
            
            svc.toPass = (self.emailFromUser.text)! 
            
        }
    }

}