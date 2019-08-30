//
//  colorsDetailsViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/29/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class colorsDetailsViewController: UIViewController {
    var allColorInfo: colorInfo!
    
    @IBOutlet weak var rgbValues: UILabel!
    
    @IBOutlet weak var hex: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
    }
    
    func setUpLabel() {
        rgbValues.text = "\(allColorInfo.rgb.fraction.r) \(allColorInfo.rgb.fraction.g) \(allColorInfo.rgb.fraction.b)"
        hex.text = allColorInfo.hex.clean
        
    }
}
