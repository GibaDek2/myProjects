//
//  requestYugioh.swift
//  YugiCards
//
//  Created by Gilberto Amaro on 27/07/22.
//

import UIKit
import Alamofire


class requestYugioh: NSObject {
    let baseUrl = "https://db.ygoprodeck.com/api/v7/cardinfo.php"
    
    func requestCards(completion: @escaping(YugiohCards?, Bool) -> Void) {
        AF.request(baseUrl, method: .get, parameters: nil).responseJSON { response in
            if response.response?.statusCode == 200 {
                do {
                    let yugiohCards = try JSONDecoder().decode(YugiohCards.self, from: response.data ?? Data())
                    completion(yugiohCards, true)
                } catch {
                    completion(nil, false)
                }
            } else {
                completion(nil, false)
            }
        }
    }
}
