//
//  ControllerYugioh.swift
//  YugiCards
//
//  Created by Gilberto Amaro on 27/07/22.
//

import UIKit

class ControllerYugioh: NSObject {
    let buttonOk = "OK"
    let showAlert = "Atenção"
    let showAlertMessageError = "Lista de cartas não encontrada"
    let xibIdentifier = "xibCell"
    let nibName = "YugiTableViewCell"
    let myRequest = requestYugioh()
    var myYugiCards: YugiohCards?
    
    var heightForRowAt: CGFloat {
        return 150
    }
    
    var numberOfRows: Int {
        return myYugiCards?.data?.count ?? 0
    }
    
    func getCardByIndex(indexPath: IndexPath) ->Datum? {
        return myYugiCards?.data?[indexPath.row]
    }
    
    func requestController(completion: @escaping(Bool) -> Void) {
        myRequest.requestCards { [weak self] myCards, success in
            if success {
                self?.myYugiCards = myCards
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
