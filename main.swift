//
//  main.swift
//  L6_OlgaDakhel
//
//  Created by MacBook on 15/03/2019.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation


enum Kitchen {
    case premium, comfort, econom
}
enum View {
    case sea, garden, city
}
enum Swimmingpool {
    case yes,no
}

protocol Vacations {
    var rooms: Int { get }
    var floor: Int { get }
    var kitchen : Kitchen {get set}
    var view : View {get}
   mutating func changeView()
}
extension Vacations {
   mutating func changeView(){
        if view == .city {
            kitchen = .econom
        } else if  view == .garden {
            kitchen = .comfort
            } else if view == .sea {
            kitchen = .premium
                }
    }
    
}
class Aparts: Vacations {
    var rooms: Int
    var floor: Int
    var kitchen: Kitchen
    var view: View
    var swimmingpool: Swimmingpool
    init( rooms: Int, floor: Int, kitchen: Kitchen, view: View, swimmingpool: Swimmingpool) {
        self.rooms = rooms
        self.floor = floor
        self.kitchen = kitchen
        self.view = view
        self.swimmingpool = swimmingpool
        
    }
}
extension Aparts: CustomStringConvertible{
    var description: String {
        return "Rooms: \(rooms), kitchen: \(kitchen), view: \(view), swimmingpool: \(swimmingpool)"
    }
    
}
    
class Hostel: Vacations {
    var rooms: Int
    var floor: Int
    var kitchen: Kitchen
    var view: View
    init (rooms: Int, floor: Int, kitchen: Kitchen, view: View){
    self.rooms = rooms
    self.floor = floor
    self.kitchen = kitchen
    self.view = view
    }
}

    extension Hostel: CustomStringConvertible{
        var description: String {
            return "Kitchen: \(kitchen), view: \(view)"
        }
    }

struct Queue <T: CustomStringConvertible> {
    var elements: [T] = []
    mutating func push (_ element : T) {
        elements.append(element)
    }
    mutating func pop () {
        elements.removeLast()
    }
    subscript (items: Int) ->T? {
        if (items >= 0) && (items < elements.count) {
            return elements [items]
        }
        return nil
    }
    
    var description: String {
        return String(describing: elements )
    }
    
}
var freeRoom = Queue <Aparts>()
var freeHostel = Queue < Hostel > ()
freeRoom.push(Aparts(rooms: 3, floor: 6, kitchen: .premium, view: .sea, swimmingpool: .yes))
freeRoom.push(Aparts(rooms: 1, floor: 23, kitchen: .econom, view: .city, swimmingpool: .no))
print (freeRoom[1]!)
print (freeRoom[3])
var freeAparts = freeRoom.elements
freeAparts.sort { $0.rooms > $1.rooms}
print (freeAparts)


var yearOfBirth = Queue <Int>()
yearOfBirth.push(1986)
yearOfBirth.push(2001)
yearOfBirth.push(2009)
var a = yearOfBirth.elements
a.sort{$0 > $1}
print(a)
