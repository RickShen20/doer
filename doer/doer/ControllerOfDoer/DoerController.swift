//
//  DoerController.swift
//  doer
//
//  Created by 沈荻凯 on 2019/7/14.
//  Copyright © 2019 Shen DiKai. All rights reserved.
//

import UIKit

class DoerController: UITableViewController {
    
    
    var doer:[Doer] = []
    var row = 0

    @IBAction func batchDelete(_ sender: Any) {
        if let indexPaths = tableView.indexPathsForSelectedRows{
            for indexPath in indexPaths{
                doer.remove(at: indexPath.row)
            }
            saveData()
            tableView.beginUpdates()
            tableView.deleteRows(at: indexPaths, with: .automatic)
            tableView.endUpdates()
        }
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.title = "edit"
        if let data = UserDefaults.standard.data(forKey: "doer"){
            do{
                doer = try JSONDecoder().decode([Doer].self,from: data)
            
            }catch{
                print(error)
            
            }
        }
        
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        editButtonItem.title = isEditing ? "complete" : "edit"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return doer.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doer", for: indexPath) as! doerCell

        // Configure the cell...
        //cell.textLabel?.text = "add new event"
        
        cell.doer.text = doer[indexPath.row].name
        cell.checkMark.text = doer[indexPath.row].checked ? "√" : ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isEditing{
            doer[indexPath.row].checked = !doer[indexPath.row].checked
            saveData()
            let cell = tableView.cellForRow(at: indexPath) as! doerCell
            cell.checkMark.text = doer[indexPath.row].checked ? "√" : ""
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            doer.remove(at: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let doerlist = doer[fromIndexPath.row]
        doer.remove(at: fromIndexPath.row)
        doer.insert(doerlist, at: to.row)
        tableView.moveRow(at: fromIndexPath, to: to)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDoer"{
            let vc = segue.destination as! todoController
            vc.delegate = self
        }else if segue.identifier == "editdoer"{
            let vc = segue.destination as! todoController
            let cell = sender as! doerCell
            row = tableView.indexPath(for: cell)!.row
            vc.name = doer[row].name
            vc.delegate = self
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

extension DoerController:doerDelegate{
    func add(name: String) {
        doer.append(Doer(name: name, checked: false))
        saveData()
        let indexPath = IndexPath(row: doer.count-1, section: 0)
        tableView.insertRows(at:[indexPath], with: .automatic)
    }
    
    func edit(name: String) {
        doer[row].name = name
        saveData()
        let indexPath = IndexPath(row :row, section:0)
        let cell = tableView.cellForRow(at: indexPath) as! doerCell
        cell.doer.text = name
    }
    func saveData(){
        do{
            let data = try JSONEncoder().encode(doer)
            UserDefaults.standard.set(data, forKey: "doer")
        }catch{
            print(error)
        }
        
    }
}
