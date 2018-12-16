//
//  MoveCollectionCell.swift
//  BoostCamp
//
//  Created by 장공의 on 16/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import UIKit
import Common

class MoveCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var ratingInfo: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    func setMovie(movie: Movie) {
        poster.downloaded(from: URL(string: movie.thumb)!)
        title.text = movie.title
        ratingInfo.text = "\(movie.reservation_grade)위 / \(movie.reservation_rate)%";
        releaseDate.text = movie.date
    }
}
