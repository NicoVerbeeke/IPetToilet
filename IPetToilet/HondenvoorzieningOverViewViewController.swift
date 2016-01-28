import UIKit
import MapKit

class HondenvoorzieningOverViewViewController: UITableViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    var voorzieningen: [Hondenvoorziening]!
    
    @IBOutlet weak var overzicht: MKMapView!
    
    //source for getting current location:
    // http://stackoverflow.com/questions/25296691/swift-get-users-current-location-coordinates
    let locationManager = CLLocationManager()
    var center = CLLocationCoordinate2D(latitude: 51.05, longitude: 3.7)
    var centerAnnotation = MKPointAnnotation()
    var visibleRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 51.05, longitude: 3.7), 1000, 1000)
    
    var count = 0
    
    override func viewDidLoad() {
        //Nodig om meerdere annotations weer te geven in de MKMapView
        self.overzicht.delegate = self
        
        //Ask for Authorisation from the user
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        visibleRegion = MKCoordinateRegionMakeWithDistance(center, 2000, 2000)
        overzicht.region = visibleRegion
        
        
        centerAnnotation.coordinate = center
        centerAnnotation.title = "U bevindt zich hier"
        overzicht.addAnnotation(centerAnnotation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation:CLLocationCoordinate2D = manager.location!.coordinate
        
        let annotationsDrawn = overzicht.annotations
        overzicht.removeAnnotations(annotationsDrawn)
        
        centerAnnotation.coordinate = currentLocation
        overzicht.addAnnotation(centerAnnotation)
        
        visibleRegion = MKCoordinateRegionMakeWithDistance(currentLocation, 2000, 2000)
        overzicht.region = visibleRegion

        
        for index in 1...(voorzieningen.count-1){
            let voorziening = voorzieningen[index]
            let location = CLLocationCoordinate2D(latitude: voorziening.plaats.latitude, longitude: voorziening.plaats.longitude)
            
            let distance = MKMetersBetweenMapPoints(MKMapPointForCoordinate(center), MKMapPointForCoordinate(location))
            
            if(distance <= 2000){
                let locationAnnotation = MKPointAnnotation()
                locationAnnotation.coordinate = location
                overzicht.addAnnotation(locationAnnotation)
            }
            
        }
        
    }
    
}