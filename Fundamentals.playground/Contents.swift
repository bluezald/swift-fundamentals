//: Playground - noun: a place where people can play

import UIKit

// (1) Variable and Constants

// You declare variable by using the keyword var
var str = "Hello, playground"

print(str)

// you declare constants by using let
let constant = "Change is the only constant"

// (2) Expressions and Operations

2 + 6
10 - 2
2 * 4
24 / 3

// each of these lines is an expression - an expression has a value
// Also, you can skip adding the semicolon in Swift

// you can remove the spaces in between the operator, but you can not mixed both

// You can do this:
let goodExpression=2+3+5

// You can't do this
 let wrong = 2+3 +5

2+6   // OK
2 + 6 // OK
2 +6  // ERROR
2+ 6  // ERROR

// The remainder operation also known as the symbol %

48 % 40

// Shift Operations

1 << 3
32 >>  2

// one reason for using shifts is to make multiplying or dividing by powers of two easy.

/** General Knowledge on Shift Operators
 In the old days, code often made use of this trick because shifting bits is much simpler for a CPU to do than complex
 multiplication and division arithmetic. Therefore the code was quicker if it used shifting. However these days, CPUs are
 much faster and compilers can even convert multiplication and division by powers of two into shifts for you. So you’ll see
 shifting only for binary twiddling, which you probably won’t see unless you become an embedded systems programmer!
 */

((8000 / (5 * 10)) - 32) >> (29 % 5)

// Math Functions

sin(45 * Double.pi / 180)

cos(135 * Double.pi / 180)

sqrt(2.0)

max(5, 10)

min(-5, -10)

// (3) Types

// Associated Type declaration

let bossLevel: Int = 10

// Inferred Declaraction

let thisWillBeAnInt = 10
let thisWillBeADouble = 3.1415

// Concatenation

var message1 = "Hello" + " my name is "
let name = "Matt"
message1 += name // "Hello my name is Matt"

// Interpolation

let message2 = "Hello my name is \(name)!"

// (4) Flow Control

// Boolean Operators
let doesOneEqualTwo = (1 == 2)
let doesOneNotEqualTwo = (1 != 2)
let alsoTrue = !(1 == 2)
let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)

// While Loop

while true {
  
}

// Repeat-While Loop

var sum = 1
repeat {
  sum = sum + (sum + 1)
} while sum < 1000

// Ranges

// Close Range
let closedRange = 0...5

// Half-Open Range
let halfOpenRange = 0..<5

// For Loops:
let count = 10
var sum2 = 0
for i in 1...count {
  sum2 += i }

// (5) Optionals
/**
 Sometimes, it’s useful to have a value that represents nothing at all. 
 Imagine a scenario where you need to refer to a person’s identifying information; you want to store the person’s name, age and occupation. 
 Name and age are both things that must have a value — everyone has them. But not everyone is employed,
 so the absence of a value for occupation is something you need to be able to handle.
 
 Optionals are Swift’s solution to the problem of representing both a value and the absence of a value
 
 */

var errorCode: Int?

// Code somewhere
errorCode = 100

print(errorCode)

// Code when requests was done
if let errorCode = errorCode {
  print(errorCode)
}

// Force Unwrapping:
print(errorCode!)

// Nil coalescing
print(errorCode ?? 200)

// (6) Collection Types

// Array
let evenNumbers = [2, 4, 6, 8]
var subscribers: [String] = []

// Dictionary
var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
var stringIntDictionary: [String : Int] = [:]

// (7) Custom Types
// Structs, Enums and Class
//  — the named model types of Swift.

/**
 
 Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. 
 One of the most important differences between structures and classes is that structures are always copied when they are passed
 around in your code, but classes are passed by reference.
 
 */

struct Card {
  var rank: Rank
  var suit: Suit
  func simpleDescription() -> String {
    return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
  }
}

enum Rank: Int {
  case ace = 1
  case two, three, four, five, six, seven, eight, nine, ten
  case jack, queen, king
  func simpleDescription() -> String {
    switch self {
    case .ace:
      return "ace"
    case .jack:
      return "jack"
    case .queen:
      return "queen"
    case .king:
      return "king"
    default:
      return String(self.rawValue)
    }
  }
}

enum ColorName: String {
  case black  = "black"
  case silver = "silver"
  case gray   = "gray"
  case white  = "white"
  case maroon = "maroon"
  case red    = "red"
  // ... and so on ...
}

enum Suit {
  case spades, hearts, diamonds, clubs
  func simpleDescription() -> String {
    switch self {
    case .spades:
      return "spades"
    case .hearts:
      return "hearts"
    case .diamonds:
      return "diamonds"
    case .clubs:
      return "clubs"
    }
  }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

/**
 When creating new objects using value types, copies are made; 
 when using reference types, the new variable refers to the same object. 
 This dissimiliarity in behavior is a critical difference between class and struct.
 */

class Shape {
  var numberOfSides = 0
  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
}

/**
 
 Enums are value types that have a set of cases, where each case can have different associated values. 
 Each value of an enum type represents a single case as defined by the enum. 
 They can’t have any stored properties.
 
 Structs, like enums, are value types but can also have stored properties.
 
 Classes, like structs, can have stored properties, and they can be built into class hierarchies that override properties and methods. 
 Because of this, explicit initialization of base classes is a requirement.
 But unlike structs and enums, classes use reference, aka sharing, semantics
 
 Reference: https://www.raywenderlich.com/119881/enums-structs-and-classes-in-swift
 
 */





