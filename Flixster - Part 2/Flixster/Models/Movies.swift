//
//  Movie.swift
//  Flixster
//
//  Created by Efrain Rodriguez on 2/8/23.
//

struct MoviesResponse: Decodable {
    let results: [Movies]
}



import Foundation
import Nuke
// Movie Model Struct
struct Movies: Decodable {
    let title: String
    let overview: String
    let backdrop_path: String
    let poster_path: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
    let id: Int
    
    
    
}





