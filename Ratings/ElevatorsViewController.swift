//
//  ElevatorsViewController.swift
//  Ratings
//
//  Created by Frederique Grenier on 2018-11-08.
//  Copyright © 2018 Frederique Grenier. All rights reserved.
//
import SwiftyJSON
import Alamofire
import UIKit

struct elevator: Decodable {
    let id: Int
    let serialNumber: String
}

class ElevatorsViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        var url = "https://rocket-api-fred.azurewebsites.net/api/elevators/status"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data,response,error) in
            
            do {
                var elevators = try JSONDecoder().decode([elevator].self, from: data!)
                
                for elevator in elevators {
                    print(elevator.id)
                }
            } catch {
                print("we got an error")
            }
            }.resume()
        
        performSegue(withIdentifier: "showlist", sender: self)
        
        
    }
}
    
//    var api: SampleData = SampleData()
////    var elevators: Any
//
//
//
//
//    required init?(coder aDecoder: NSCoder)
//    {
////        api = SampleData()
//
//        super.init(coder: aDecoder)
//    }
//}
//// MARK: - UITableViewDataSource
//extension ElevatorsViewController {
//
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 2
//        //        return elevators.count
//    }
//
//    override func tableView(_ tableView: UITableView,
//                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        _ = self.api.getSomeSampleData().done{_ in
//            print(self)
//        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ElevatorCell", for: indexPath)
////print(elevators)
////        let elevator = elevators[indexPath.row]
////        cell.textLabel?.text = elevator.name
////        cell.detailTextLabel?.text = elevator.name
//        return cell
//    }
//}






