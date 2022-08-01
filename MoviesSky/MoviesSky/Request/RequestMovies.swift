//
//  RequestMovies.swift
//  MoviesSky
//
//  Created by Gilberto Amaro on 01/08/22.
//

import UIKit
import Alamofire

class RequestMovies: NSObject {
    let baseUrl = "https://sky-frontend.herokuapp.com/movies"
    
    func requestMovies(completion: @escaping(Movies?, Bool) -> Void) {
        AF.request(baseUrl, method: .get, parameters: nil).responseJSON { response in
            if response.response?.statusCode == 200 {
                do {
                    let movies = try JSONDecoder().decode(Movies.self, from: response.data ?? Data())
                    completion(movies, true)
                } catch {
                    completion(nil, false)
                }
            } else {
                completion(nil, false)
            }
        }
    }
}
