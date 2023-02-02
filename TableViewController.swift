//
//  TableViewController.swift
//  HW8
//
//  Created by Nikol Vasileva on 22.01.23.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        RequestManager.fetchData()
        


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherParameters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        guard weatherParameters.count > indexPath.row else {
            return cell
        }
        
        cell.textLabel?.text = weatherParameters[indexPath.row]
        cell.detailTextLabel?.text = weatherParametersDesc[indexPath.row]

    

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped at \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        myIndex = indexPath.row
        self.performSegue(withIdentifier: "SegueMoreInfo", sender: self.tableView.cellForRow(at: indexPath))
    }


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

    
    // MARK: - Navigation

//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         guard let segueIdentifier = segue.identifier else {
//             return
//         }
//         switch segueIdentifier {
//         case "SegueMoreInfo":
//             guard let destinationController = segue.destination as? ViewController else {
//                 return
//             }
//             guard let selectedCell = sender as? UITableViewCell else {
//                 return
//             }
//             destinationController.temperatureSofia = selectedCell.textLabel?.text ?? ""
//         default:
//             return
//         }
//     }

}
