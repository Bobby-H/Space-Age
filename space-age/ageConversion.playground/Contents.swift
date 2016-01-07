import UIKit

let earthYearInSeconds: Float = 31557600.00

func ageToSeconds(ageInYears: Int) -> Float {
    return Float(ageInYears) * earthYearInSeconds
}

var age = ageToSeconds(25)

func ageToPlanetYears(ageInEarthSeconds: Float, orbitalRatio: Float) -> Float {
    return ageInEarthSeconds / (earthYearInSeconds) / orbitalRatio
}

ageToPlanetYears(age, orbitalRatio: 1.8808158)

struct Planet {
    let name: String
    let orbitalRatio: Float
    let earthYearInSeconds: Float = 31557600.00
    let demonym: String
    
    func ageToPlanetYears(ageInEarthSeconds: Float) -> Float {
        let unroundedAge = (ageInEarthSeconds / (self.earthYearInSeconds) / self.orbitalRatio)
        return round(1000 * unroundedAge)/1000
    }
}

let mercury = Planet(name: "mercury", orbitalRatio: 0.2408467, demonym: "mercurian")
mercury.name
mercury.demonym
mercury.ageToPlanetYears(age)

print("You are \(mercury.ageToPlanetYears(age)) in \(mercury.demonym) years!")