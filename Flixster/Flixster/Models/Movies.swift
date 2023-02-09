//
//  Movies.swift
//  Flixster
//
//  Created by Efrain Rodriguez on 2/7/23.
//

import Foundation
import Nuke
// Movie Model Struct
struct Movies {
    let original_title: String
    let overview: String
    let movieImage: URL
    let frontImage: URL
    let voteAverage: Double
    let vote_count: Int
    let popularity: Double
    
    
    
}

// Extension with a mock movies static var
extension Movies {
    
    // Array of mock movies
    static var mockMovies: [Movies] = [
        Movies(original_title: "Puss in Boots: The Last Wish", overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.", movieImage: URL(string:"https://image.tmdb.org/t/p/original//faXT8V80JRhnArTAeYXz0Eutpv9.jpg")!, frontImage: URL(string:"https://image.tmdb.org/t/p/original/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!, voteAverage: 8.6, vote_count: 3278, popularity: 5840.194)
    
    ]
}
