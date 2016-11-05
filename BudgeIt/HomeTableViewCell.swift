//
//  HomeTableViewCell.swift
//  BudgeIt
//
//  Created by Matt on 11/5/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var numCommentsLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var yourRatingSlider: UISlider!
    @IBOutlet weak var youRatingLabel: UILabel!
    @IBOutlet weak var avgRatingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var post:Post!{
        didSet{
            numCommentsLabel.text = "\(post.comments.count) Comments"
            postedByLabel.text = post.postedBy
            var yourRating = post.ratedBy[Int((FIRAuth.auth()?.currentUser?.uid)!)!]
            if let yourRating = yourRating{
                yourRatingSlider.value = yourRating
            }
            youRatingLabel.text = String(describing: yourRating)
            
            avgRatingLabel.text = String(post.totalRating/post.numRatings)
            titleLabel.text = post.title
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        yourRatingSlider.minimumValue = 0
        yourRatingSlider.maximumValue = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
