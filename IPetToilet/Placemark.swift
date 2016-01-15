//
//  Placemark.swift
//  IPetToilet
//
//  Created by Verbeeke Nico on 15/01/16.
//  Copyright © 2016 Hogent. All rights reserved.
//

import Foundation

struct Placemark: JSONDecodable{
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