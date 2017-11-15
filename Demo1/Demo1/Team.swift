//
//  Team.swift
//  Demo1
//
//  Created by Vincent Bacalso on 15/11/2017.
//  Copyright © 2017 bluezald. All rights reserved.
//

import Foundation

class Team {
  let name: String
  // TODO: Must be set to weak
  var members: [Person] = []
  
  init(name: String) {
    self.name = name
    print("Team \(name) is initialized")
  }
  
  deinit {
    print("Team \(name) is being deallocated")
  }
}
