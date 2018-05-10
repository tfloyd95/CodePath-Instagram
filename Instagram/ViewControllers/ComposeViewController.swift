//
//  ComposeViewController.swift
//  Instagram
//
//  Created by ARG Lab on 2/25/18.
//  Copyright © 2018 Odin. All rights reserved.
//

import UIKit
import Parse
import  RSKPlaceholderTextView

class ComposeViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var comments: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func share(_ sender: Any) {
        let post = Gram()
        post.postUserImage(image: imageview.image!, withCaption: comments.text, completion: {(state: Bool, error:Error?) in
            if state {
                print("post uploaded")
            }else{
                print(error?.localizedDescription)
            }
        })
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func takePicture(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .camera
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        imageview.image = image
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
