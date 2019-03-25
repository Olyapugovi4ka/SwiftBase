//
//  main.swift
//  L7_OlgaDakhel
//
//  Created by MacBook on 19/03/2019.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation

/*Задание 1
enum NoWinner: Error {
    case noWinner
    case noMoney
}
class Lottery {
    var money: Int
    var winner: Int
    func divideMoney () throws -> Int? {
        guard money > 0 else {
            throw NoWinner.noMoney
        }
        guard winner > 0 else {
            throw NoWinner.noWinner
        }
    return money / winner
    }

    init (money:Int, winner: Int){
    self.money = money
    self.winner = winner
    }
}
let lottery = Lottery(money: 600, winner: 0)
do {
    try lottery.divideMoney()
} catch NoWinner.noMoney {
    print ("No money")
}catch NoWinner.noWinner {
    print ("No winner")
}*/

//Задание 2
enum GiftFalse: Error {
case noGifts
}
struct Gifts {
    var name: String
    
}
class GiveGifts {
    var gifts: [Gifts] = [Gifts]()
    
    func giveMeGift () throws {
        guard gifts.count > 0 else {
            throw GiftFalse.noGifts
        }
    }
}
let myGift = GiveGifts ()
do {
    try myGift.giveMeGift()
} catch GiftFalse.noGifts
    { print ("Подарков нет, но вы держитесь")
    }

