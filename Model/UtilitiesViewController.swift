//
//  UtilitiesViewController.swift
//  DailyNewsIOS
//
//  Created by user on 2018-08-13.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class UtilitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIImageView{
    
    func downloadImage(from imgurl : String){
        
        let urlRequest = URLRequest(url: URL(string: imgurl)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if(error != nil){
                
                print(error!)
                
                return
                
            }
            
            //Whenever u have to update the UI u have to do it in main thread, otherwise it will crash
            
            DispatchQueue.main.async {
                
                self.image = UIImage(data : data!)
                
            }
        }
        
        task.resume()
        
    }
}
