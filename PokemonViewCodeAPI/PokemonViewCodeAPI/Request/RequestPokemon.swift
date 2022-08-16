//
//  RequestPokemon.swift
//  PokemonViewCodeAPI
//
//  Created by Gilberto Amaro on 16/08/22.
//

import UIKit
import Alamofire

class RequestPokemon: NSObject {
    let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
    
    func requestList(completion: @escaping(PokemonList?, Bool) -> Void) {
        let param = ["limit":"151"]
        
        AF.request(baseUrl, method: .get, parameters: param).responseJSON { response in
            if response.response?.statusCode == 200 {
                do {
                    let pokemonList = try JSONDecoder().decode(PokemonList.self, from: response.data ?? Data())
                    completion(pokemonList, true)
                } catch {
                    completion(nil, false)
                }
            } else {
                completion(nil, false)
            }
        }
    }
}
