//
//  PostersViewController.swift
//  Flixster
//
//  Created by Efrain Rodriguez on 2/12/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    
    var poster: Posters!
    
    var posters: [Posters] = []
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return posters.count
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Getting a collection view cell (based in the identifier you set in story board)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostersCell", for: indexPath) as! PostersCell
        
        let poster = posters[indexPath.item]
        
        let imageUrl = poster.poster_path
        
        let poster_path = "https://image.tmdb.org/t/p/w500/" + imageUrl
        
        Nuke.loadImage(with: URL(string:"\(poster_path)")!, into: cell.posterImageView)
        
        return cell
    }
    
    
    override func viewDidLoad() {
        //collectionView.dataSource = self
        super.viewDidLoad()
        
        
        
        
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=f1420207d0461e836085dc2dd20a270e")!
        let request = URLRequest(url: url)
        
        
        
        
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(PostersSearchResponse.self, from: data)
                
                let poster = response.results
                
                
                
                DispatchQueue.main.async {
                    self?.posters = poster
                    self?.collectionView.reloadData()
                }
                
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
            
        }
        
        task.resume()
        
        collectionView.dataSource = self
        
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        
        
        layout.sectionInset = UIEdgeInsets(top: 0 , left: 26, bottom: 0, right:26)
        
        layout.minimumInteritemSpacing = 0
        
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width-20)/4, height: self.collectionView.frame.size.height/4)
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           
            // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let postersDetailViewController = segue.destination as? PostersDetailViewController {
            
            // Use the index path to get the associated track
            let poster =  posters[indexPath.row]
            
            // Set the movie on the detail to the movie
            postersDetailViewController.poster = poster
            
        }
        
    }
    
}






/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



