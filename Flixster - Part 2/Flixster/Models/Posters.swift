//
//  Posters.swift
//  Flixster
//
//  Created by Efrain Rodriguez on 2/12/23.
//

import Foundation


struct PostersSearchResponse: Decodable {
    let results: [Posters]
}

struct Posters: Decodable {
    let title: String
    let poster_path: String
    let overview: String
    let backdrop_path: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
    let id: Int?
}

