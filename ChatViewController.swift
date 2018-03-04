//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Kishor Subedi on 3/3/18.
//  Copyright © 2018 Kishor Subedi. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts : [PFObject] = [] //initialized posts property as an array of PFObjects
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatMessageField: UITextField!
    
    @IBAction func onSend(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage["author"] = PFUser.current()
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch()
    {
        let query = PFQuery(className: "Message")
        query.addDescendingOrder("created_at")
        query.includeKey("author")
        query.includeKey("text")
        
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            
            if (error == nil) {
                print(73434)
                self.posts = posts!
                self.tableView.reloadData()
            }
            else
            {
                print(error)
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        let post = posts[indexPath.row]
        
        cell.historymessageLabel.text = post["text"] as! String?
                return cell
    }
    func onTimer() {
        fetch()
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
