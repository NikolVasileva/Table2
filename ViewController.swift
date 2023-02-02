//
//  ViewController.swift
//  HW8
//
//  Created by Nikol Vasileva on 22.01.23.
//

import UIKit

var temperatureSofia: String? = ""
var elevationSofia: String? = ""
var windDirection: String? = ""
var windSpeed: String? = ""
var lastUpdate: String? = ""

class ViewController: UIViewController {

    @IBOutlet weak var wetherParametersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wetherParametersLabel.text = weatherParametersDesc[myIndex]
        RequestManager.fetchData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.wetherParametersLabel.text = weatherParametersDesc[myIndex]
//        self.wetherParametersLabel.text = "Температурата е \(RequestManager.temperature) °C"
    }


}

