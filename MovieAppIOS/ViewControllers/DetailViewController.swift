//
//  DetailViewController.swift
//  MovieAppIOS
//
//  Created by Tardes on 16/7/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie! //La ! es el late init var de Kotlin
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.title = movie.Title
        
        searchMovieByID(id: movie.imdbID!)
    }
    
    func searchMovieByID(id: String){
        Task {
            movie = await MovieProvider.findMovieById(id: id)
            loadMovie()
        }
    }
    
    func loadMovie() {
        posterImageView.loadFrom(url: movie.Poster)
        titleLabel.text = movie.Title
        plotLabel.text = movie.Plot
        countryLabel.text = movie.Country
        genreLabel.text = movie.Genre
        directorLabel.text = movie.Director
        durationLabel.text = movie.Runtime
        yearLabel.text = movie.Year
    }
    
}
