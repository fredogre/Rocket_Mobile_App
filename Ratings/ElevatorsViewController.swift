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

class ElevatorsViewController: UITableViewController {
    
    var api: SampleData = SampleData()
//    var elevators: Any

    
    
    
    required init?(coder aDecoder: NSCoder)
    {
//        api = SampleData()

        super.init(coder: aDecoder)
    }
}
// MARK: - UITableViewDataSource
extension ElevatorsViewController {


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2
        //        return elevators.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.api.getSomeSampleData().done{_ in
            print(self)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElevatorCell", for: indexPath)
//print(elevators)
//        let elevator = elevators[indexPath.row]
//        cell.textLabel?.text = elevator.name
//        cell.detailTextLabel?.text = elevator.name
        return cell
    }
}




