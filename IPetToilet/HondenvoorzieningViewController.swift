import UIKit
import MapKit
import CoreLocation

class HondenvoorzieningViewController: UITableViewController, CLLocationManagerDelegate{
    
    var voorziening: Hondenvoorziening!
    
    @IBOutlet weak var soort: UILabel!
    @IBOutlet weak var plaatsOmschrijving: UILabel!
    @IBOutlet weak var gemeente: UILabel!
    @IBOutlet weak var plaats: MKMapView!
    @IBOutlet weak var postcode: UILabel!
    @IBOutlet weak var afstand: UILabel!
    
    var center = CLLocationCoordinate2D()
    //source for getting current location: 
    // http://stackoverflow.com/questions/25296691/swift-get-users-current-location-coordinates
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        
        //Ask for Authorisation from the user
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        soort.text = voorziening.soort
        plaatsOmschrijving.text = voorziening.plaatsOmschrijving
        gemeente.text = voorziening.gemeente
        postcode.text = voorziening.postcode
        
        center = CLLocationCoordinate2D(latitude: voorziening.plaats.latitude, longitude: voorziening.plaats.longitude)
        let visibleRegion = MKCoordinateRegionMakeWithDistance(center, 1000, 1000)
        plaats.region = visibleRegion
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        plaats.addAnnotation(annotation)
        
       /* if CLLocationManager.locationServicesEnabled(){
            var currentLocation:CLLocationCoordinate2D = self.locationManager.location!.coordinate
            
            let currentMapLocation = MKMapPointForCoordinate(currentLocation)
            
            let voorzieningLocation = MKMapPointForCoordinate(center)
            
            //berekend in km -> /1000
            let calcAfstand = MKMetersBetweenMapPoints(currentMapLocation, voorzieningLocation) / 1000
            
            let afstandString = NSString(format: "%.3f", calcAfstand)
            
            afstand.text = (afstandString as String) + " km hiervandaan."
            
        }
        else{
            afstand.text = "IPetToilet mag uw huidige locatie niet gebruiken."
        }*/

    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var currentLocation:CLLocationCoordinate2D = manager.location!.coordinate
        
        let currentMapLocation = MKMapPointForCoordinate(currentLocation)
        
        let voorzieningLocation = MKMapPointForCoordinate(center)
        
        //berekend in km -> /1000
        let calcAfstand = MKMetersBetweenMapPoints(currentMapLocation, voorzieningLocation) / 1000
        
        let afstandString = NSString(format: "%.3f", calcAfstand)
        
        afstand.text = (afstandString as String) + " km hiervandaan."
    }
    
    

    
}