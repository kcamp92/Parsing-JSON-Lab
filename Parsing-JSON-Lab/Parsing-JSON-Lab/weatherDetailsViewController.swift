//
//  weatherDetailsViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/28/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class weatherDetailsViewController: UIViewController {
    var allWeatherInfo: listInfo!
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var weatherTemp: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        // Do any additional setup after loading the view.
    }
    
    func setUpLabel() {
        weatherDescription.text = allWeatherInfo.weather[0].description
        weatherTemp.text = "\(allWeatherInfo.main.temp)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
