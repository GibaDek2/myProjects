//
//  PokemonListController.swift
//  PokemonViewCodeAPI
//
//  Created by Gilberto Amaro on 16/08/22.
//

import UIKit

class PokemonListController: NSObject {
    let showAlert = "Alert!"
    let showMessage = "Request Fail"
    let showButton = "OK"
    let titleOnTop = "My Pokemon List"
    let myRequest = RequestPokemon()
    var myPokemon: PokemonList?
    
    var heightForRowAt: CGFloat {
        return 70
    }
    
    var numberOfRowsInTableView: Int {
        return myPokemon?.results?.count ?? 0
    }
    
    func getResultByIndexPath(indexPath: IndexPath) -> Result? {
        return myPokemon?.results?[indexPath.row]
    }
    
    func requestListController(completion: @escaping(Bool) -> Void) {
        myRequest.requestList { [weak self] myList, success in
            if success {
                self?.myPokemon = myList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
