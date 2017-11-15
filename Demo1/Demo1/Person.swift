//
//  Person.swift
//  Demo1
//
//  Created by Vincent Bacalso on 15/11/2017.
//  Copyright © 2017 bluezald. All rights reserved.
//

import Foundation

class Person {
  
  var name: String
  private(set) var currentTeam: Team?
  
  init(name: String) {
    self.name = name
    print("Person \(name) is initialized")
  }
  
  deinit {
    print("Person \(name) is being deallocated")
  }
  
  func add(team: Team) {
    self.currentTeam = team
  }
}
