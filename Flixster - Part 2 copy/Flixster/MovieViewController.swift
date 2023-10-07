//
//  MovieViewController.swift
//  Flixster
//
//  Created by Efrain Rodriguez on 2/8/23.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource {
    
    var movies: [Movies] = []
    
    var movie: Movies!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=f1420207d0461e836085dc2dd20a270e")!
   
        
        let request = URLRequest(url: url)
        
        
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            // Veryfing that we have the data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(MoviesResponse.self, from: data)
                
                let movies = response.results
                
                
                
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.tableView.reloadData()
                }
     
            }catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
            
            
        }
        
        task.resume()
        
        tableView.dataSource = self
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        if let cell = sender as? UITableViewCell,
           
            // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
       
            let movie =  movies[indexPath.row]
            
            // Set the movie on the detail to the movie
            detailViewController.movie = movie
            
        }
        
        // TODO: Pt 1 - Add table view data source methods
        
        
    }
    
    
    
    
}
