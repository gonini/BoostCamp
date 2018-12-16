//
//  ImageViewContoller.swift
//  BoostCamp
//
//  Created by 장공의 on 17/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import UIKit

class ImageViewContoller: UIViewController {
    
    @IBOutlet weak var poster: UIImageView!
    
    public var posterImage: UIImage?
    
    override func viewDidLoad() {
        poster.image = posterImage!
    }

    
}
