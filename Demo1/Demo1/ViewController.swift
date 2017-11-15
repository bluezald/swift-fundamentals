//
//  ViewController.swift
//  Demo1
//
//  Created by Vincent Bacalso on 14/11/2017.
//  Copyright © 2017 bluezald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var usernameTextfield: UITextField!
  @IBOutlet weak var passwordTextfield: UITextField!
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let Person = Person(name: "Luke Skywaler")
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("viewWillDisappear")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("viewDidDisappear")
  }
  
  @IBAction func login(_ sender: Any) {
    
    if let user = usernameTextfield.text {
      
      if user.characters.count < 1 {
        self.statusLabel.text = "Input Username"
        self.statusLabel.textColor = .red
      } else {
        self.statusLabel.text = "Hello " + user
        self.statusLabel.textColor = .green
      }
    }
  }
  
}

