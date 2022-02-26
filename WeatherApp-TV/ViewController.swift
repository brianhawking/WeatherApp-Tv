//
//  ViewController.swift
//  WeatherApp-TV
//
//  Created by Brian Veitch on 2/26/22.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentConditions: UILabel!
    @IBOutlet weak var currentDewPoint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // TODO 1
        // where to get the data
        
        let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334")
        
        if url != nil {
            
            if let data = NSData(contentsOf: url! as URL) {
                
                // TODO 2
                // prase through data
                
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! [String: AnyObject]
                    
                    // TODO 3
                    // temp store the parsed data in a dictionary
                    
                    let newDict = parsed
                    print(newDict)
//                    print(newDict["currently"]!["summary"] as Any)
//                    print(newDict["currently"]!["temperature"] as Any)
//                    print(newDict["currently"]!["dewPoint"] as Any)
                    
                    let temp = newDict["currently"]!["temperature"]!
                    let summary = newDict["currently"]!["summary"]!
                    let dewPoint = newDict["currently"]!["dewPoint"]!

                    
                    self.currentTemp.text = "Temperature: \(temp!)°"

                    self.currentConditions.text = "Conditions: \(summary!)"
                    self.currentDewPoint.text = "DewPoint: \(dewPoint!)"
                    
                }
                
                // TODO 4
                // if you have any problems
                catch let error as NSError {
                    print("A JSON parsing error has occurent, here are the details: \(error)")
                }
                
            }
        }
        
    }


}

