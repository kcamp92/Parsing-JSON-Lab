//
//  colorsViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/29/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class colorsViewController: UIViewController {
    
    var allColors = [colorInfo]() {
        didSet {
            colorsTableView.reloadData()
        }
        
    }

    @IBOutlet weak var colorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        loadColorData()
        colorsTableView.dataSource = self
        //colorsTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func loadColorData() {
        guard let pathToData = Bundle.main.path(forResource: "colorsAPI", ofType: "json") else {
            fatalError ("colorsAPI.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let colorFromJSON = try
                allColors = ColorData.getColorData(data: data)
            
        } catch {
            print(error)
        }
    }
    
   
}
extension colorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorsTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let colorsInfo = allColors[indexPath.row]
        cell.textLabel?.text = colorsInfo.name
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(allColors.r), green: CGFloat(allColors.g), blue: CGFloat(allColors.b), alpha: 1)
        
        return cell
    }
}

// extension colorsViewController: UITableViewDelegate{

//}
