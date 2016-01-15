class Hondenvoorziening{
    let soort: String
    let plaats: Location
    let plaatsOmschrijving: String
    let gemeente: String
    let postcode: String
    
    init(soort: String, plaats: Location, plaatsOmschrijving:String, gemeente:String, postcode:String) {
        self.soort = soort
        self.plaats = plaats
        self.plaatsOmschrijving = plaatsOmschrijving
        self.gemeente = gemeente
        self.postcode = postcode
    }
}

struct Location
{
    var latitude: Double
    var longitude: Double
}