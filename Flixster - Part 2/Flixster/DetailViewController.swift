//
//  DetailViewController.swift
//  Flixster
//
//  Created by Efrain Rodriguez on 2/8/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    var movie: Movies!
    
    @IBOutlet weak var overview: UITextView!

    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var vote_count: UILabel!
    @IBOutlet weak var vote_average: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    

    
      
    

    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        
        let path = "https://image.tmdb.org/t/p/w500/" + movie.backdrop_path
        
        Nuke.loadImage(with: URL(string:"\(path)")!, into:movieImage)
        
        overview.text = String(movie.overview)
        movieTitle.text = movie.title
      
         let voteC = Int(movie.vote_count)
         vote_count.text = String(voteC)
         
         let voteA = Double(movie.vote_average)
         vote_average.text =  String(voteA)
         
        let movPopularityMov = Double(movie.popularity)
         popularity.text = String(movPopularityMov)
         
        
        
        
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
