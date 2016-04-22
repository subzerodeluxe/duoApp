import UIKit

class ProductsController: UITableViewController {
    
    var tables = [Table]() // initieer lege array met Table objecten
    var ref = Firebase(url: "https://elshampoo.firebaseio.com/tables/3/orders") // Firebase referentie naar tables
    
    var toPass:String = ""   // maak ruimte voor tafelnummer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Test of tafelnummer goed wordt doorgegeven vanuit SelectTableController, log in console
        print("Tafelnummer is " + toPass)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        // Prepareer Firebase
            ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
                
                var newTables = [Table]() // lege array met Table objecten die dadelijk wordt gevuld met
                
                // test of object wordt opgehaald uit Firebase, loop er door heen en print alle
                //properties
                print(snapshot.childrenCount)
                let enumerator = snapshot.children
                while let rest = enumerator.nextObject() as? FDataSnapshot {
                    print(rest.value)
                    }

            // loop door Firebase, en voeg properties toe vanuit Table aan newTables array
            for item in snapshot.children {
                 
                let barItem = Table(snapshot: (item as? FDataSnapshot)!)
                newTables.append(barItem) // voegt toe aan array

            }
            
            self.tables = newTables // lege tables array wordt nu gevuld met new Tables array
            self.tableView.reloadData() // reload data
        }) // einde van ref.observeSingleEventOfType
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tables.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell") as UITableViewCell!
        let tableItem = tables[indexPath.row]
        
        // display alle items op naam
        cell.textLabel?.text = tableItem.name
        
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
}
        