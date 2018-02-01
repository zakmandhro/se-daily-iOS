//
//  CommentsViewController.swift
//  SEDaily-IOS
//
//  Created by jason on 1/31/18.
//  Copyright © 2018 Koala Tea. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var postId: String? // TODO: make optional so that we can check for it and display error if nil
    let networkService = API()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        /*
        networkService.createComment(podcastId: self.postId, onSuccess: {
            
        }, onFailure: { _ in
            
        })
        */
        if let postId = postId {
            networkService.getComments(podcastId: postId, onSuccess: { (comments) in
                print("got comments")
                print(comments)
                
            }) { (error) in
                print("error")
                print(error)
            }
        } else {
            print("postId is null")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
            cell.textLabel?.text = "Comment?"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "replyCell", for: indexPath)
            cell.textLabel?.text = "Comment?"
            return cell
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}