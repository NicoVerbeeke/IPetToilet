import UIKit
import MapKit

class HondenvoorzieningOverViewViewController: UITableViewController{
    var voorzieningen: [Hondenvoorziening]!
    
    @IBOutlet weak var soort: UILabel!
    @IBOutlet weak var plaatsOmschrijving: UILabel!
    @IBOutlet weak var gemeente: UILabel!
    @IBOutlet weak var plaats: MKMapView!
    @IBOutlet weak var postcode: UILabel!
    
    override func viewDidLoad() {
        

        
        /*let center = CLLocationCoordinate2D(latitude: voorziening.plaats.latitude, longitude: voorziening.plaats.longitude)
        let visibleRegion = MKCoordinateRegionMakeWithDistance(center, 1000, 1000)
        plaats.region = visibleRegion
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        plaats.addAnnotation(annotation)*/
    }
    
}