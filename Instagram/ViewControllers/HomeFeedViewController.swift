//
//  HomeFeedViewController.swift
//  Instagram
//
//  Created by ARG Lab on 2/25/18.
//  Copyright © 2018 Odin. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    
    var InstaPosts: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        getPhotos()
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        //tableView.insertSubview(refresh, at: 0)
        tableView.estimatedRowHeight = 400
        tableView.refreshControl = refresh
        tableView.autoresizesSubviews = true
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl){
        getPhotos()
        refreshControl.endRefreshing()
    }
    
    func getPhotos(){
        let query = PFQuery(className: "Gram")
        query.limit = 20
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground(block: {(posts: [PFObject]?, error: Error?) in
            if error == nil{
                self.InstaPosts = posts!
                self.tableView.reloadData()
            }else{
                print(error?.localizedDescription)
            }
        })
        
        
    }
    
    
    @IBAction func logout(_ sender: Any) {
        PFUser.logOut()
        self.performSegue(withIdentifier: "logoutSegue", sender: sender)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InstaPosts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstaCell") as! InstaCell
        let post = InstaPosts[indexPath.row] as! Gram
        cell.comment.text = post.caption
        cell.dateTime.text = post.createdAt?.description
        do{
            try cell.instaImage.image = UIImage(data: post.media.getData())
        }catch {
            print(error.localizedDescription )
        }
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.beginUpdates()
        tableView.endUpdates()
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
