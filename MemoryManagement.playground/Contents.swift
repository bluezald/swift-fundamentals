// Source: https://www.raywenderlich.com/134411/arc-memory-management-swift

class User {
  var name: String
  
  init(name: String) {
    self.name = name
    print("User \(name) is initialized")
  }
  
  deinit {
    print("User \(name) is being deallocated")
  }
  
  private(set) var phones: [Phone] = []
  func add(phone: Phone) {
    phones.append(phone)
    phone.owner = self
  }
  
}

// 1
//do {
//  let user1 = User(name: "John")
//}

/**
 Reference cycles
 
 Imagine a situation where two objects reference one another.
 Since each has a non-zero reference count, deallocation, of both objects, can never occur.
 
 This is called a strong reference cycle. It fools ARC and prevents it from cleaning up. 
 As you can see, the reference count at the end is not zero, and thus object1 and object2 
 are never deallocated even though they’re no longer required.
 
 */

class Phone {
  let model: String
  // weak
  var owner: User?
  
  init(model: String) {
    self.model = model
    print("Phone \(model) is initialized")
  }
  
  deinit {
    print("Phone \(model) is being deallocated")
  }
}

// 2
//do {
//  let user1 = User(name: "John")
//  let iPhone = Phone(model: "iPhone 6s Plus")
//  user1.add(phone: iPhone)
//}

/**
 Weak Reference
 
 To break strong reference cycles, you can specify the relationship between reference counted 
 objects as weak. Unless otherwise specified, all references are strong. Weak references, by
 contrast, don’t increase the strong reference count of the object.
 
 
 Unowned References
 
 There is another reference modifier you can use that doesn’t increase
 the reference count: unowned.
 
 Unowned reference will always be available throught out the variable it is referencing
 
*/

class BankAccount {
  
  unowned var owner: User
  
  init(owner: User) {
    self.owner = owner
  }
  
}

/**
 logically a bank account cannot live without a reference of a person, so that’s why it’s 
 important that it has a reference to a person. Notice also that the person is required when
 initializing a BankAccount, this emphasize that, unowned properties are weak but required 
 to have a value.
 */

