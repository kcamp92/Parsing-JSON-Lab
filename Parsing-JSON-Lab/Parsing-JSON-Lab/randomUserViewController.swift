//
//  randomUserViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/28/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class randomUserViewController: UIViewController {
    var userInfo = [resultsInfo](){
        didSet {
            randomUserTableVIew.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserData()
        randomUserTableVIew.dataSource = self
        randomUserTableVIew.delegate = self
        
    }
    @IBOutlet weak var randomUserTableVIew: UITableView!
    
    func loadUserData() {
        guard let pathToData = Bundle.main.path(forResource: "randomUser", ofType: "json") else {
            fatalError ("randomUser.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let randomUserFromJSON = try
                userInfo = UserData.getUserData(data: data)
            
        } catch {
            print(error)
        }
    }
}

extension randomUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "userDetailsViewController") as? userDetailsViewController {
            storyBoard.allUserInfo = userInfo[indexPath.row]
            
            navigationController?.pushViewController(storyBoard, animated: true)
            
        }
    }
}

extension randomUserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = randomUserTableVIew.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let resultsInfo = userInfo[indexPath.row]
        cell.textLabel?.text = "\(resultsInfo.name.first.capitalized) \(resultsInfo.name.last.capitalized)"
        cell.detailTextLabel?.text = resultsInfo.email
        return cell
    }
    
    
}
