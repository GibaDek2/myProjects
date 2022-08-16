//
//  PokemonDetailController.swift
//  PokemonViewCodeAPI
//
//  Created by Gilberto Amaro on 16/08/22.
//

import UIKit

class PokemonDetailController: NSObject {
    let showAlert = "Alert!"
    let showMessage = "Pokemon not found"
    let showButton = "OK"
    let titleOnTop = "My Pokemon Detail"
    let myRequest = RequestPokemon()
    var myDetail: PokemonDetail?
    var selectedPokemon: Result?
    
    var pokemonName: String {
        return myDetail?.name ?? ""
    }
    
    var pokemonUrl: String {
        return selectedPokemon?.url ?? ""
    }
    
    var pokemonImageUrl: URL? {
        return URL(string: myDetail?.sprites?.frontDefault ?? "")
    }
    
    var numberOfRowAbilities: Int {
        return myDetail?.abilities?.count ?? 0
    }
    
    var numberOfRowGames: Int {
        return myDetail?.gameIndices?.count ?? 0
    }
    
    func setSelectedPokemon(result: Result?) {
        self.selectedPokemon = result
    }
    
    func getAbilitiesByIndex(indexPath: IndexPath) -> Ability? {
        return myDetail?.abilities?[indexPath.row]
    }
    
    func getGamesByIndex(indexPath: IndexPath) -> GameIndex? {
        return myDetail?.gameIndices?[indexPath.row]
    }
    
    func requestDetailController(url: String, completion: @escaping(Bool) -> Void) {
        myRequest.requestDetail(url: url) { [weak self] myDetailList, success in
            if success {
                self?.myDetail = myDetailList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
