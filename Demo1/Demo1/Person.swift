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
  
  init(name: String) {
    self.name = name
    print("Person \(name) is initialized")
  }
  
  deinit {
    print("Person \(name) is being deallocated")
  }
  
  private(set) var teams: [Team] = []
  
  func add(team: Team) {
    teams.append(team)
    team.members.append(self)
  }
}
