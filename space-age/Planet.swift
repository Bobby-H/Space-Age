//
//  Planet.swift
//  space-age
//
//  Created by Bobby Hutter on 1/5/16.
//  Copyright © 2016 swik apps. All rights reserved.
//

import Foundation
// Foundation, in ios dev, is a standard library

struct Planet{
    let name: String
    let orbitalRatio: Float
    let earthYearInSeconds: Float = 31557600.00
    let demonym: String
    
    func ageToPlanetYears(ageInEarthSeconds: Float) -> Float {
        let unroundedAge = ageInEarthSeconds / (earthYearInSeconds * self.orbitalRatio)
        return round(1000 * unroundedAge) / 1000
    }
}