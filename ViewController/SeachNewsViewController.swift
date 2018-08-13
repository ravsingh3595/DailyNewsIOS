//
//  SeachNewsViewController.swift
//  DailyNewsIOS
//
//  Created by user on 2018-08-13.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit
import Alamofire

enum FilterCategory: String {
    case India = "in"
    case Sports = "sport"
    case Bussiness = "business"
}

class SeachNewsViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var searchNews: UISearchBar!
    @IBOutlet weak var searchResultTableView: UITableView!
    
    var sportsNewsArray: [Dictionary<String, Any>] = []
    
    var businessNewsArray: [Dictionary<String, Any>] = []
    
    var indiaNewsArray: [Dictionary<String, Any>] = []
    
    var searchedKeywordNewsArray: [Dictionary<String, Any>] = []
    
    var category: String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        searchNews.delegate = self
        
        getData(completed: {
            self.searchResultTableView.reloadData()
        }, type: FilterCategory.India.rawValue)
        
        //print(indiaNewsArray)
        self.view.backgroundColor = UIColor(red: 131.0/255, green: 24.0/255, blue: 73.0/255, alpha: 1)
        searchResultTableView.backgroundColor = UIColor.clear
        
        searchResultTableView.dataSource = self
        searchResultTableView.delegate = self

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indiaNewsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as? SearchBarNewsCell
        {
            cell.configureCell(imageUrl: indiaNewsArray[indexPath.row]["urlToImage"] as! String, text: indiaNewsArray[indexPath.row]["title"] as! String)
            return cell
        }
        else
        {
            print("empty")
            return UITableViewCell()
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        <#code#>
//    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            getData(completed: {
                self.searchResultTableView.reloadData()
            }, type: FilterCategory.India.rawValue)
        case 1:
            getData(completed: {
                self.searchResultTableView.reloadData()
            }, type: FilterCategory.Sports.rawValue)
        case 2:
            getData(completed: {
                self.searchResultTableView.reloadData()
            }, type: FilterCategory.Bussiness.rawValue)
        default:
            break
        }
        self.searchResultTableView.reloadData()
    }
    
    

    typealias downloadData = () -> ()

    func getData(completed : @escaping downloadData, type: String )
    {
        switch type {
        case FilterCategory.India.rawValue:
            Alamofire.request("https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=0a121c964a604666bf93c55b45ad4f60").responseJSON{ response in
                
                if let data = response.result.value
                {
                    let dataFromJson: Dictionary = data as! Dictionary<String, Any>
                    self.indiaNewsArray = dataFromJson["articles"] as! [Dictionary<String, Any>]
                   // print(self.indiaNewsArray)
                }
            }
        case FilterCategory.Sports.rawValue:
            Alamofire.request("https://newsapi.org/v2/top-headlines?country=ca&category=sport&apiKey=0a121c964a604666bf93c55b45ad4f60").responseJSON{ response in
                
                if let data = response.result.value
                {
                    let dataFromJson: Dictionary = data as! Dictionary<String, Any>
                    self.sportsNewsArray = dataFromJson["articles"] as! [Dictionary<String, Any>]
//                    print(self.sportsNewsArray)
                }
            }
        case FilterCategory.Bussiness.rawValue:
            Alamofire.request("https://newsapi.org/v2/top-headlines?country=ca&category=sport&apiKey=0a121c964a604666bf93c55b45ad4f60").responseJSON{ response in
                
                if let data = response.result.value
                {
                    let dataFromJson: Dictionary = data as! Dictionary<String, Any>
                    self.businessNewsArray = dataFromJson["articles"] as! [Dictionary<String, Any>]
//                    print(self.businessNewsArray)
                }
            }
        default:
            Alamofire.request("https://newsapi.org/v2/everything?q=\(type)&apiKey=0a121c964a604666bf93c55b45ad4f60").responseJSON{ response in
                
                if let data = response.result.value
                {
                    let dataFromJson: Dictionary = data as! Dictionary<String, Any>
                    self.searchedKeywordNewsArray = dataFromJson["articles"] as! [Dictionary<String, Any>]
                }
            }
            completed()
        }
    }
    
}
