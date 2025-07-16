//
//  MovieViewCell.swift
//  MovieAppIOS
//
//  Created by Tardes on 16/7/25.
//

import UIKit

class MovieViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    
    func render (with movie: Movie) {
        titleLabel.text = movie.Title
        posterImageView.loadFrom(url: movie.Poster)
        yearLabel.text = movie.Year
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
