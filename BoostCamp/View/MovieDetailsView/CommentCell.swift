//
//  File.swift
//  BoostCamp
//
//  Created by 장공의 on 17/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import UIKit
import Common

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var content: UITextView!
    
    func setComment(comment: Comment) {
        userName.text = comment.writer
        date.text = comment.timestamp
        content.text = comment.contents
    }
}
