//
//  SampleData.swift
//  Ratings
//
//  Created by Frederique Grenier on 2018-11-08.
//  Copyright © 2018 Frederique Grenier. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import SwiftyJSON

final class SampleData {
    
    static func generateElevatorsData() -> [Elevator] {
        return [
            Elevator(name: "One World Trade Center"),
            Elevator(name: "Google"),
            Elevator(name: "Salesforce Tower")
        ]
    }
    let queue_user_initiated = DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
    
//    func getSomeSampleData() -> Todo {
//        let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
//        let todo: Todo
//
//        Alamofire.request(todoEndpoint)
//            .responseJSON { response in
//                // check for errors
//                guard response.result.error == nil else {
//                    // got an error in getting the data, need to handle it
//                    print("error calling GET on /todos/1")
//                    print(response.result.error!)
//                    return
//                }
//                // make sure we got some JSON since that's what we expect
//                guard let json = response.result.value as? [String: AnyObject] else {
//                    print("didn't get todo object as JSON from API")
//                    print("Error: \(String(describing: response.result.error))")
//                    return
//                }
//                // get and print the title
//                guard let todoTitle = json["title"] as? String else {
//                    print("Could not get todo title from JSON")
//                    return
//                }
//                print("The title is: " + todoTitle)
////                let completed = true
////
////                if json["completed"] != "true"{
////                    completed = false
////                }
//
//                todo(userId: json["userId"] as! Int, id: json["id"] as! Int, title: json["title"] as! String, completed: true)
//
//    }
//        return todo
//}
//}


func getSomeSampleData() -> Promise<Any>
{
    return Promise<Any> {
        seal in
        
        self.queue_user_initiated.async
            {
                
                var request = URLRequest(url: NSURL(string: "https://jsonplaceholder.typicode.com/todos/1")! as URL)
                    request.httpMethod = HTTPMethod.get.rawValue
//                    request.setValue("application/json", forHTTPHeaderField: "Accept")
//                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let req = Alamofire.request(request)
                req.responseJSON { response in
                    
                    
                    switch(response.result) {
                    case .failure(_):
                        
                        break
                        
                    case .success(_):
                        break
                    }
                    
                    
                    guard let data = response.result.value else
                    {
                        
                        return
                    }
                    
                    let json = JSON(data)
                        seal.fulfill(data)
     }
}
}
}
}
