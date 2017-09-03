//
//  APIConsumer.swift
//  Tasheel
//
//  Created by mobile dev3 on 8/17/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import Foundation
import UIKit

protocol APIConsumerDelegate {
    func APIResponseArrived(_ Response:AnyObject)
}

class APIConsumer {
    var delegate:APIConsumerDelegate! = nil
    
    
    
    func doRequestGet(_ url:String)  {
        
        let url = URL(string:url)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            do{
                if error != nil{
                    print("error")
                    return
                }
                print("resoponse : \((response as?  HTTPURLResponse)?.statusCode)")
                if let res = response as?  HTTPURLResponse, res.statusCode == 200 {
                    let jsonDic: NSDictionary = try (JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary)!
                    
                    DispatchQueue.main.async(execute: {
                        if self.delegate != nil {
                            self.delegate.APIResponseArrived(jsonDic)
                        }
                    })
                }else{
                    print(response!.description)
                    return
                }
            }
            catch{
                print("Exception thrown")
            }
            
        }).resume()
    }
    
    
    
    func doRequestPost(_ url:String, postString: [String: Any])  {
        
        let url = URL(string:url)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            do{
                if error != nil{
                    print("error")
                    // print(error?.localizedDescription)
                    return
                }
                print("resoponse : \((response as?  HTTPURLResponse)?.statusCode)")
                if let res = response as?  HTTPURLResponse, res.statusCode == 200 {
                    let jsonDic: NSDictionary = try (JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary)!
                    if self.delegate != nil {
                        self.delegate.APIResponseArrived(jsonDic)
                    }

                                   }else{
                    print(response!.description)
                    return
                }
            }
            catch{
                print("Exception thrown")
            }
            
        }).resume()
    }
    
    
    
    
    
}



