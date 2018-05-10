//
//  InstaCell.swift
//  Instagram
//
//  Created by ARG Lab on 2/26/18.
//  Copyright © 2018 Odin. All rights reserved.
//

import UIKit
import Parse
import RSKPlaceholderTextView

class InstaCell: UITableViewCell {

    @IBOutlet weak var instaImage: UIImageView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var commentView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let a = true
        comment.isHidden = a
        timeStamp.isHidden = a
        dateTime.isHidden = a
        timeView.isHidden = a
        commentView.isHidden = true
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            let a = false
            comment.isHidden = a
            timeStamp.isHidden = a
            dateTime.isHidden = a
            timeView.isHidden = a
            commentView.isHidden = a
            
        }else{
            let a = true
            comment.isHidden = a
            timeStamp.isHidden = a
            dateTime.isHidden = a
            timeView.isHidden = a
            commentView.isHidden = a
        }
        
        
        // Configure the view for the selected state
    }
    
    

}
