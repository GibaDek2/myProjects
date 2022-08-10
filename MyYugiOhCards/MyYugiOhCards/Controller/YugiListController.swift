//
//  YugiListController.swift
//  MyYugiOhCards
//
//  Created by Gilberto Amaro on 10/08/22.
//

import UIKit

class YugiListController: NSObject {
    let showAlert = "Alert"
    let showAlertMessage = "Request Fail"
    let showOkButton = "OK"
    let titleTop = "Cards List"
    let myRequest = Request()
    var myYugi: YugiCards?
    
    var heightForRowAt: CGFloat {
        return 250
    }
    
    var numberOfRowsInTableView: Int {
        return myYugi?.data?.count ?? 0
    }
    
    func getDataByIndex(indexPath: IndexPath) -> Datum? {
        return myYugi?.data?[indexPath.row]
    }
    
    func requestController(completion: @escaping(Bool) -> Void) {
        myRequest.requestYugi { [weak self] myList, success in
            if success {
                self?.myYugi = myList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
