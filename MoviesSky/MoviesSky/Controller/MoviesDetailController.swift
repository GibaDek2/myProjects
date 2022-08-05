//
//  MoviesDetailController.swift
//  MoviesSky
//
//  Created by Gilberto Amaro on 05/08/22.
//

import UIKit

class MoviesDetailController: NSObject {
    var selectedMovie: Content?
    
    var movieUrl: URL? {
        return URL(string: selectedMovie?.images?.first?.url ?? "")
    }
    
    var movieTitle: String {
        return selectedMovie?.title ?? ""
    }
    
    var movieDescription: String {
        return selectedMovie?.contentDescription ?? ""
    }
    
    func setSelectedMovie(content: Content?) {
        self.selectedMovie = content
    }
}
