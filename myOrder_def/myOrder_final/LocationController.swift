import UIKit
import CoreLocation

class LocationController: UIViewController, CLLocationManagerDelegate {
    
    let locMgr = CLLocationManager()
    
    @IBOutlet weak var myAddress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locMgr.desiredAccuracy = kCLLocationAccuracyBest //accurtie van de locatie
        locMgr.requestWhenInUseAuthorization() //toegang tot locatie op iphone
        locMgr.startUpdatingLocation()//locatie word geupdate
        locMgr.delegate = self //belangrijk: haalt de gegevens van de locatie op
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let myCurrentLoc = locations[locations.count - 1] //locatie van dat moment word opgehaald
        
        CLGeocoder().reverseGeocodeLocation(myCurrentLoc) { (myPlacements, myError) in //haalt de vertalings opties van de lacatie op
            
            if myError != nil {
                
            }
            
            if let myPlacement = myPlacements?.first {
                
                let myAddress = " \(myPlacement.thoroughfare!), \(myPlacement.locality!)" //vertaalt de locatie in leesbare data(straatnaam en plaats)
                
                self.myAddress.text = myAddress //plaatst het addres in een label en geeft het weer
            }
        }
        
    }
}



