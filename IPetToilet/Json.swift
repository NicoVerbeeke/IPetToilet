        import Foundation

class Json
{
    class func readHondenvoorzieningen(data: NSData) -> [Hondenvoorziening] {
        
        
        
        var voorzieningen: [Hondenvoorziening] = []
        
        
        var jsonData: NSDictionary?
        do{
            jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        
        let jsonPlacemarks = jsonData!["Document"]!["Folder"]!!["Placemark"]! as! NSArray?
        let upperBorder = jsonPlacemarks!.count - 1;
        
        
        for index in 0...upperBorder{
            var jsonPlacemark = jsonPlacemarks![index] as! NSMutableDictionary
            
            var latitude = 3.7 as! Double
            var longitude = 51.0 as! Double
            
            // create a Location from the coordinates
            let place = jsonPlacemark["Point"]!["coordinates"]! as? NSDictionary
            if let actualCoordinatesString = place!["@text"] as? String{
                let seperatedCoordinates = actualCoordinatesString.componentsSeparatedByString(",")
                let longitudeHelper = seperatedCoordinates[0] as! NSString
                longitude = longitudeHelper.doubleValue as Double
                let latitudeHelper = seperatedCoordinates[1] as! NSString
                latitude = latitudeHelper.doubleValue as Double
            }
            let plaats = Location(latitude: latitude, longitude: longitude)
        
            let simpleData = jsonPlacemark["ExtendedData"]!["SchemaData"]!!["SimpleData"]! as? NSArray
            
            var gemeente = ""
            var plaatsOmschrijving = ""
            var soort = ""
            var postcode = ""

            if let kind = simpleData![3]["@text"] as? String{
                soort = kind
            }
            
            if let placeDescription = simpleData![6]["@text"] as? String{
                plaatsOmschrijving = placeDescription
            }
            
            if let community = simpleData![2]["@text"] as? String {
                gemeente = community
            }
            
            if let postalCode = simpleData![1]["@text"] as? String{
                postcode = postalCode
            }
            
            voorzieningen.append(Hondenvoorziening(soort: soort, plaats: plaats, plaatsOmschrijving: plaatsOmschrijving, gemeente: gemeente, postcode: postcode))
            
            
        }
        
        return voorzieningen
    }
}