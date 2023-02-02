//
//  RequestManager.swift
//  HW8
//
//  Created by Nikol Vasileva on 22.01.23.
//

import Foundation

class RequestManager {
    
    static let url = URL(string:"https://api.open-meteo.com/v1/forecast?latitude=42.70&longitude=23.32&current_weather=true")
    
    static var temperature:Double = 0.0
    static var elevation:Double = 0.0
    static var winddirection:Double = 0.0
    static var windspeed:Double = 0.0
    static var time:String = ""
    
    
    class func fetchData() {
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let payload = try?
                    JSONSerialization.jsonObject(with: data!) as? [String: Any] else {
                print("Cannot parse the data")
                return
            }
            print(payload)
            guard let currentWeather = payload["current_weather"] as? [String:Any] else {
                return
            }
            
            guard let temperature = currentWeather["temperature"] as? Double else {
                return
            }
            guard let elevation = payload["elevation"] as? Double else {
                return
            }
            guard let winddirection = currentWeather["winddirection"] as? Double else {
                return
            }
            guard let windspeed = currentWeather["windspeed"] as? Double else {
                return
            }
            guard let time = currentWeather["time"] as? String else {
                return
            }
        
            guard let data = data, let payload = try?
                    JSONDecoder().decode(Weather.self, from: data) else {
                return
            }
            print(payload)
            
            RequestManager.temperature = temperature
            RequestManager.elevation = elevation
            RequestManager.winddirection = winddirection
            RequestManager.winddirection = windspeed
            RequestManager.time = time
        })
        task.resume()
    }
    
}
