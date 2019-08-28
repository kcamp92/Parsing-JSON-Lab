//
//  WeatherViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/27/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var weatherInfo = [listInfo](){
        didSet {
            weatherTableView.reloadData()
        }
    
    }
    
    @IBOutlet weak var weatherTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWeatherData()
        weatherTableView.dataSource = self
        weatherTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    func loadWeatherData() {
        guard let pathToData = Bundle.main.path(forResource: "weathersAPI", ofType: "json") else {
            fatalError ("weathersAPI.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let weatherFromJSON = try
           weatherInfo = WeatherData.getWeatherData(data: data)
            
        } catch {
            print(error)
        }
    }
  
    
    

}
extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "weatherDetailsViewController") as? weatherDetailsViewController {
            storyBoard.allWeatherInfo = weatherInfo[indexPath.row]
            
            navigationController?.pushViewController(storyBoard, animated: true)
            
        }
    }
    
    
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let listInfo = weatherInfo[indexPath.row]
        cell.textLabel?.text = listInfo.name
        cell.detailTextLabel?.text = listInfo.weather[0].description
        return cell
    }
    
    
    
}
