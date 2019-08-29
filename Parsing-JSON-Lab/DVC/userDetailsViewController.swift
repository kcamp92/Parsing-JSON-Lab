//
//  userDetailsViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/29/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class userDetailsViewController: UIViewController {
    var allUserInfo: resultsInfo!
    
    @IBOutlet weak var dob: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()

    }
    

    func setUpLabel() {
        phoneNumber.text = allUserInfo.phone
        dob.text = allUserInfo.dob.date
        address.text = "\(allUserInfo.location.street)\(allUserInfo.location.city)\(allUserInfo.location.state)"
        
        
    }
}
