//
//  Request.swift
//  MyYugiOhCards
//
//  Created by Gilberto Amaro on 10/08/22.
//

import UIKit
import Alamofire

class Request: NSObject {
    let baseUrl = "https://db.ygoprodeck.com/api/v7/cardinfo.php"
    
    func requestYugi(completion: @escaping(YugiCards?, Bool) -> Void) {
        AF.request(baseUrl, method: .get, parameters: nil).responseJSON { response in
            if response.response?.statusCode == 200 {
                do {
                    let yugiCards = try JSONDecoder().decode(YugiCards.self, from: response.data ?? Data())
                    completion(yugiCards, true)
                } catch {
                    completion(nil, false)
                }
            } else {
                completion(nil, false)
            }
        }
    }
}
