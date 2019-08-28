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

        // Do any additional setup after loading the view.
    }
    
    
    func loadWeatherData() {
       
    }
  
//    
//    private func loadData() {
//        guard let pathToData = Bundle.main.path(forResource: "episode", ofType: "json") else {
//            fatalError("episodes.json file not found")
//        }
//        let internalUrl = URL(fileURLWithPath: pathToData)
//        do {
//            let data = try Data(contentsOf: internalUrl)
//            let episodesFromJSON = try Episode.getEpisodes(from: data)
//            episodes = episodesFromJSON
//        }
//        catch {
//            fatalError("An error occurred: \(error)")
//        }
//    }

}
extension WeatherViewController: UITableViewDelegate {}

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
