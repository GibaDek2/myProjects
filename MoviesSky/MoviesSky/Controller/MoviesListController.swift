//
//  MoviesListController.swift
//  MoviesSky
//
//  Created by Gilberto Amaro on 01/08/22.
//

import UIKit

class MoviesListController: NSObject {
    let title = "Movies List"
    let showAlertError = "Error"
    let showMessageError = "Request Error"
    let showOkButton = "OK"
    let myRequest = RequestMovies()
    var myMovies: Movies?
    
    var heightForRowAt: CGFloat {
        return 280
    }
    
    var numberOfRowsInTableView: Int {
        return myMovies?.contents?.count ?? 0
    }
    
    func getContentByIndex(indexPath: IndexPath) -> Content? {
        return myMovies?.contents?[indexPath.row]
    }
    
    func requestMoviesController(completion: @escaping(Bool) -> Void) {
        myRequest.requestMovies { [weak self] myList, success in
            if success {
                self?.myMovies = myList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

