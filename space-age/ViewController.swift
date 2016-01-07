//
//  ViewController.swift
//  space-age
//
//  Created by Bobby Hutter on 12/16/15.
//  Copyright © 2015 swik apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var ageInput: UITextField!
    
    let planets = PlanetCollection()
    var selectedPlanet = Planet(name: "Earth", orbitalRatio: 1.0, demonym: "Earth")
    let earthYearInSeconds: Float = 31557600.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calculationLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func ageToSeconds(ageInYears: Int) -> Float {
        return Float(ageInYears) * earthYearInSeconds
    }
    
    @IBAction func showCalculation() {
        let age = ageInput.text
        if let age = ageInput.text {
            if age != "" {
                let ageInSecs = ageToSeconds(Int(age)!)
                let planetAge = selectedPlanet.ageToPlanetYears(ageInSecs)
            calculationLabel.text = "you are \(planetAge) in \(selectedPlanet.demonym) years!"
        } else {
            calculationLabel.text = "please enter an age"
        }
      }
        calculationLabel.hidden = false
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return planets.milkyWay.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return planets.milkyWay[row].name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPlanet = planets.milkyWay[row]
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = planets.milkyWay[row].name
        let color = UIColor(red: 1, green: 253/255, blue: 225/255, alpha: 1)
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Futura", size: 26.0)!,NSForegroundColorAttributeName:color])
        return myTitle
    }

}

