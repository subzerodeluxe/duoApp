import UIKit

class DataController: UITableViewController {
    
    
    var bars = [Bar]() // array met Bar objecten

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData() // laad JSON data
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberBars = bars.count // aantal rijen wordt lengte van bars array
        return numberBars
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let currentRow = indexPath.row // index van row
        let currentBar = self.bars[currentRow] // pakt de juiste bar aan de hand aan de hand van index
        
        cell.textLabel?.text = currentBar.name // display juiste naam van bar
        return cell
    }
    

    func loadJsonData() { // laad de JSON data
        let url = NSURL(string: "http://t-timefontys.nl/public/bars.json")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do
            {
                if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                {
                    self.parseJsonData(jsonObject) // roep parse methode aan - staat hieronder - om JSON data te parsen
                }
            }
            catch // indien het niet goed gaat
            {
                print("Het gaat niet goed he?!")
            }
        }
        dataTask.resume()
        
    }
    
    
    func parseJsonData(jsonObject:AnyObject) {
        if let jsonData = jsonObject as? NSArray {
            for item in jsonData { // loop door opgehaalde JSON data
                let newBar = Bar(
                    name: item.objectForKey("name") as! String
                )
                bars.append(newBar) // voeg nieuw Bar object toe aan bars array
            }
        }
        self.tableView.reloadData() // laad het maar zien
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // vind de juiste bar
        let selectedRow = self.tableView.indexPathForSelectedRow
        let selectedBar = self.bars[selectedRow!.row]
        
        // geef de juiste bar door aan SelectTableController
        let controller = segue.destinationViewController as! SelectTableController
        controller.selectedBar = selectedBar
    }
}