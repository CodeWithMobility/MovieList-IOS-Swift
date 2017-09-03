//
//  NetworkManager.swift
//  Tasheel
//
//  Created by mobile dev3 on 8/17/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import Foundation

@objc protocol NetworkManagerDelegate {
    @objc optional func ApiResponsegetArrived(_ Response:AnyObject,Token:String)
}
class NetworkManager :  APIConsumerDelegate {
    var delegate:NetworkManagerDelegate!
    var objAPIConsumer : APIConsumer = APIConsumer()
    var restDelegate : NetworkManagerDelegate! = nil
    var token :String = String()
   // var viewActivity = ProgressUtils()
    
    func initwith()->AnyObject{
        self.objAPIConsumer = APIConsumer()
        self.objAPIConsumer.delegate = self
        return self
        
    }
    func getContactDetails(_ Url:String, userToken:String) {
        print(Url)
        self.token = userToken;
        self.objAPIConsumer.doRequestGet(Url)
    }
    func APIResponseArrived(_ Response:AnyObject){
        restDelegate.ApiResponsegetArrived!(Response,Token: self.token)
        //viewActivity.hideActivityIndicator()
    }
    
    
//    func getLogin(_ Url:String, userToken:String){
//        self.token = userToken;
//        self.objAPIConsumer.doRequestGet(Url)
//    }
//    
//    func postService(_ Url:String, postbody: [String: Any], userToken:String){
//        
//        self.token = userToken;
//        self.objAPIConsumer.doRequestPost(Url, postString: postbody )
//    }
//    
    
}
