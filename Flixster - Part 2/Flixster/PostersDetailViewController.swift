//
//  PostersDetailViewController.swift
//  Flixster
//
//  Created by Efrain Rodriguez on 2/13/23.
//

import UIKit
import Nuke


class PostersDetailViewController: UIViewController {

    var poster: Posters!
    
  

    

    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var vote_average: UILabel!
    
    @IBOutlet weak var vote_count: UILabel!
    
    @IBOutlet weak var popularity: UILabel!
    

    @IBOutlet weak var movieOverview: UITextView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
 
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
   
        
      

        let path = "https://image.tmdb.org/t/p/w500/" + poster.backdrop_path
        
        Nuke.loadImage(with: URL(string:"\(path)")!, into:movieImage)
        
        movieOverview.text = String(poster.overview)
        movieTitle.text = poster.title
      
         let voteC = Int(poster.vote_count)
         vote_count.text = String(voteC)
         
        let voteA = Double(poster.vote_average)
         vote_average.text =  String(voteA)
         
        let movPopularityMov = Double(poster.popularity)
         popularity.text = String(movPopularityMov)
        
      
      
         
    }
    

}
