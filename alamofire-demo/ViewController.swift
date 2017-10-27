//
//  ViewController.swift
//  alamofire-demo
//
//  Created by Etome on 2017-10-26.
//  Copyright © 2017 Etome. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var DataLabel: UILabel!
    @IBOutlet weak var ResponseLabel: UILabel!
    @IBOutlet weak var StationId: UITextField!
    
    let translinkApiKey = "da7U5YMtuSBla2QK3msq"
    let hRequestLink = "https://api.translink.ca/RTTIAPI/V1/stops/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func HRequestTranslink(_ sender: Any) {
        let parameters: Parameters = [
            "apiKey": translinkApiKey
        ]
        
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(hRequestLink + StationId.text!, parameters: parameters, headers: headers).validate().responseJSON {
            response in
            //self.ResponseLabel.text = "\(response.response!)"
            //self.DataLabel.text = "\(response.result.value!)"
            switch response.result {
            case .success:
                if let json = response.result.value {
                    self.DataLabel.text = "JSON: \(json)"
                    self.ResponseLabel.text = "Response: \(response.response!)"
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

