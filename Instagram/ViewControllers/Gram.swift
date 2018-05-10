//
//  Gram.swift
//  Instagram
//
//  Created by ARG Lab on 2/26/18.
//  Copyright © 2018 Odin. All rights reserved.
//

import Foundation
import CoreData
import Parse


class Gram: PFObject, PFSubclassing {
    
    
    @NSManaged var media: PFFile
    @NSManaged var author: PFUser
    @NSManaged var caption: String
    @NSManaged var likesCount: Int
    @NSManaged var commentCount: Int
    @NSManaged var profilePic: PFFile
    
    
    
    static func parseClassName() -> String {
        return "Gram"
    }
    
    
    func postUserImage(image: UIImage, withCaption: String, completion: @escaping PFBooleanResultBlock){
        let post = Gram()
        post.setPFFileFromImage(image: image)
        post.author = PFUser.current()!
        post.caption = withCaption
        post.likesCount = 0
        post.commentCount = 0
        
        post.saveInBackground(block: completion)
    }
    
    func setPFFileFromImage(image: UIImage?){
        
        if let image = image{
            if let imageData = UIImagePNGRepresentation(image){
                let file =  PFFile(name: "image.png", data: imageData)
                media = file!
                
            }
        }
        
    }
    
}
