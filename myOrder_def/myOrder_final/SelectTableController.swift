import UIKit

class SelectTableController: UIViewController {
    
    var selectedBar : Bar?
    
    var tables = [Table]() // initieer lege array met Table objecten
    let ref = Firebase(url: "https://elshampoo.firebaseio.com/tables") // Firebase referentie naar tables
    
    
    var toPass:String = ""   // Email adres doorgestuurd vanuit ViewController
    @IBOutlet weak var whichbar: UILabel! // label waarin naam van bar wordt getoond
    @IBOutlet weak var enterTable: UITextField! // input field waarin gebruiker tafel nummer opgeeft
    @IBAction func confirm(sender: AnyObject) {
        
        let barNumber = self.enterTable?.text // haal tafelnummer op uit inputfield
        // test of goed wordt doorgegeven
        print(barNumber)
        
        let table:String = barNumber! // stop tafelnummer in nieuwe string table
        
        let tables: [String: String] = [
            "name": "Tafel " + table,
            "email": toPass
        ] // nieuwe array tables waarin tafel nummer (en dus naam van tafel) en email adres van de ingechekte gast wordt toegevoegd
        
        let tableRef = ref.childByAppendingPath(barNumber) // voegt tafelnummer toe aan firebase ref, path wordt dan bijvoorbeeld /tables/(tafelnummer)
        
        tableRef.updateChildValues(tables) // voeg gevulde tables array toe aan nieuwe Firebase path

    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.whichbar.text = self.selectedBar?.name
        
        // Zorgt ervoor dat keyboard (inputfield) verdwijnt wanneer gebruiker ergens anders in view tapt
        enterTable.addTarget(self, action:#selector(SelectTableController.confirm(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    func dismissKeyboard() {
    
        view.endEditing(true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) { // Stuur tafelnummer door naar Products controller
        if (segue.identifier == "segueProducts") {
            let svc = segue.destinationViewController as! ProductsController // referentie naar ProductsController is nu svc
            
            svc.toPass = (self.enterTable?.text)! // stuur tafelnummer door naar ProductsController
            
        }
    }
    
}



