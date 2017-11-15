//
//  PeopleTableViewController.swift
//  Demo2
//
//  Created by Vincent Bacalso on 15/11/2017.
//  Copyright © 2017 bluezald. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {

  var datasource: [Person] = []
  
  func readPeople(from jsonFile: String) -> [Person] {
    
    var people: [Person] = []
    
    do {
      if let file = Bundle.main.url(forResource: jsonFile, withExtension: "json") {
        let data = try Data(contentsOf: file)
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        if let object = json as? [String: Any] {
          // json is a dictionary
          
          if let results = object["results"] as? [Any] {
            
            for person in results {
              
              /**
               "gender": "male",
               "name": {
               "title": "mr",
               "first": "romain",
               "last": "hoogmoed"
               }
               */
              
              if let aPerson = person as? [String: Any] {
                
                var personName = "unknown"
                if let name = aPerson["name"] as? [String: String] {
                  personName = name["title"]! + " " + name["first"]! + " " + name["last"]!
                }
                
                let personObject = Person(name: personName)
                
                if let gender = aPerson["gender"] as? String {
                  if gender == "male" {
                    personObject.gender = .male
                  } else {
                    personObject.gender = .female
                  }
                }
                
                people.append(personObject)
                
              }
              print(person)
              
            }
            
          }
          
          print(object)
        } else if let object = json as? [Any] {
          // json is an array
          print(object)
        } else {
          print("JSON is invalid")
        }
      } else {
        print("no file")
      }
    } catch {
      print(error.localizedDescription)
    }
    
    
    return people
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.datasource = self.readPeople(from: "people")
    self.tableView.reloadData()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return self.datasource.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
    
    let item = self.datasource[indexPath.row]
    
    cell.textLabel?.text = item.name
    if let gender = item.gender {
      cell.imageView?.image = UIImage(named: gender.rawValue)
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80.0
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
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */

}
