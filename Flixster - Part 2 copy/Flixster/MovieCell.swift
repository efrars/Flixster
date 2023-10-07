//
//  MovieCell.swift
//  Flixster
//
//  Created by Efrain Rodriguez on 2/8/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        
    }
    
    func configure(with movie: Movies) {
        
        let path = "https://image.tmdb.org/t/p/w500/" + movie.poster_path
        
        movieTitle.text = movie.title
        movieOverview.text = String(movie.overview)
        
        Nuke.loadImage(with: URL(string:"\(path)")!, into:movieImage)
        
    }
    
  
    
    
}
