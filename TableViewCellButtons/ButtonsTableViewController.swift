//
//  ButtonsTableViewController.swift
//  TableViewCellButtons
//
//  Created by alex on 17/4/2025.
//

import UIKit

class ButtonsTableViewController: UITableViewController {

    var fruits = [Fruit]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        fruits.append(Fruit(name: "Banana", price: 2.50, emoji: "🍌")) //for the emoji press cmd + ctrl + space
        fruits.append(Fruit(name: "Pineapple", price: 5.99, emoji: "🍍"))
        fruits.append(Fruit(name: "Watermelon", price: 6.00, emoji: "🍉"))
        fruits.append(Fruit(name: "Strawberry", price: 4.99, emoji: "🍓"))
        fruits.append(Fruit(name: "Grapes", price: 3.52, emoji: "🍇"))
        fruits.append(Fruit(name: "Appple", price: 1.64, emoji: "🍏"))
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruits.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ButtonsTableViewCell
        // Configure the cell...
        let fruit = fruits[indexPath.row]
        
        cell.fruitImageView.image = fruit.emoji.emojiToImage()
        cell.fruitNameLabel.text = fruit.name
        cell.fruitPriceLabel.text = "\(fruit.price) $"

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    
    //A simple example of what you can do in the cell
    func setCell(color:UIColor, at indexPath: IndexPath){
         
        // I can change external things
        self.view.backgroundColor = color
        // Or more likely change something related to this cell specifically.
        let cell = tableView.cellForRow(at: indexPath )
        cell?.backgroundColor = color
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        /**
         Here configure whatever you would like to do when the user presses the Buy Button
         */
        let buyAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Buy") { action, view, actionPerformed in
            self.setCell(color: .green, at: indexPath)
        }
        buyAction.backgroundColor = .blue
        
        /**
         Here configure whatever you would like to do when the user presses the Cart Button
         */
        let addToCartAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Cart") { action, view, actionPerformed in
            self.setCell(color: .orange, at: indexPath)
        }
        addToCartAction.backgroundColor = .purple
        
        //Add actions to the row
        return UISwipeActionsConfiguration(actions: [buyAction, addToCartAction])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        /**
         Here configure whatever you would like to do when the user presses the Buy Button
         */
        let infoAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Info") { action, view, actionPerformed in
            self.setCell(color: .white, at: indexPath)
        }
        infoAction.backgroundColor = .orange
        
        
        
        //Add actions to the row
        return UISwipeActionsConfiguration(actions: [infoAction])
    }
    
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
