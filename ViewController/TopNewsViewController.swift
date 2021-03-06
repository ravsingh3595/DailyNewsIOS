
//  TopNewsViewController.swift
//  DailyNewsIOS
//
//  Created by user on 2018-08-11.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit
import Alamofire

class TopNewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var topNewsTableView: UITableView!

    var newsArray: [Dictionary<String, Any>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topNewsTableView.dataSource = self
        topNewsTableView.delegate = self
        
        getData {
            self.topNewsTableView.reloadData()
        }
        
        self.view.backgroundColor = UIColor(red: 131.0/255, green: 24.0/255, blue: 73.0/255, alpha: 1)
        topNewsTableView.backgroundColor = UIColor.clear
    
    }
    
    func getData(completed : @escaping downloadData){
        Alamofire.request("https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=0a121c964a604666bf93c55b45ad4f60").responseJSON{ response in
             //print(response)
            
            if let data = response.result.value
            {
                let dataFromJson: Dictionary = data as! Dictionary<String, Any>
                self.newsArray = dataFromJson["articles"] as! [Dictionary<String, Any>]
                //print(dataFromJson)
                
            }
        completed()
        
        }
    }
    
    typealias downloadData = () -> ()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? NewsCell
        {
            cell.configureCell(imageUrl: newsArray[indexPath.row]["urlToImage"] as! String, text: newsArray[indexPath.row]["title"] as! String)
            return cell
        }
        else
        {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
}

