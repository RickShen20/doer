//
//  todoController.swift
//  doer
//
//  Created by 沈荻凯 on 2019/7/14.
//  Copyright © 2019 Shen DiKai. All rights reserved.
//

import UIKit
protocol doerDelegate {
    func add(name:String)
    func edit(name:String)
    
}
class todoController: UITableViewController {
    var delegate:doerDelegate?
    var name: String?
    
    @IBOutlet weak var doerinput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doerinput.becomeFirstResponder()
        doerinput.text = name
        if name != nil{
            navigationItem.title = "edit event"
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func done(_ sender: Any) {
        if let name = doerinput.text, !name.isEmpty{
            if self.name != nil{
                delegate?.edit(name: name)
                
            }else{
                delegate?.add(name: name)
            }
        }
        navigationController?.popViewController(animated: true)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
