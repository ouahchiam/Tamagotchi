//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Ouahchia, Mohamed (JD) on 17/11/2023.
//

import Foundation

class Tamagotchi {
    private var properties: [String: Double] = [
        "hunger": 0,
        "bowels": 0,
        "age": 0,
        "weight": 1,
        "disciplineMeter": 100, // descending
        "attention": 100,
        "health": 100,
    ]
    let feedAmount: Double = 10
    let disciplineAmount: Double = 20
    private let debounces: [String: Double] = [ // debounce in seconds
        "disciplineMeter" : 20,
        "defecate" : 20,
    ]
    private var lastTriggered: [String: Date] = [
        "disciplineMeter": Date(),
        "defecate": Date(),
    ]
    private let heartbeatDecrement: [String: Double] = [
        "hunger": 1,
        "disciplineMeter": -1,
        "attention": -0.5
    ]
    
    init(weight: Double) {
        self.properties["weight"] = weight
    }
    
    func returnDiff(date1: Date, date2: Date) -> Double {
        return date1.timeIntervalSince(date2)
    }
    
    func feed() {
        if properties["hunger"]! > feedAmount {
            properties["hunger"]! -= feedAmount
            properties["bowels"]! += 20
        }
        else {
            properties["hunger"] = 0
                properties["bowels"]! += 2
        }
    }
    
    func defecate() {
        if returnDiff(date1: lastTriggered["defecate"]!, date2: Date()) > debounces["defecate"]! {
            print("Debounce active")
            return
        }
        properties["bowels"] = 2
    }
    
    func discipline() {
        if returnDiff(date1: lastTriggered["disciplineMeter"]!, date2: Date()) > debounces["disciplineMeter"]! {
            print("Debounce active")
            return
        }
        if properties["disciplineMeter"]! < (100 -  disciplineAmount) {
            properties["disciplineMeter"]! += disciplineAmount
        }
        else {
            properties["disciplineMeter"]! = 100
        }
    }
    
    func outputProperties() {
        for (property, amount) in properties {
            print("\(property.uppercased()) is currently at \(amount).")
        }
    }
    
    func heartbeat() {
        for (property, amount) in heartbeatDecrement {

                if amount > 0 { // amount is positive (i.e. works its way up to 100)
                    if properties[property]! < (100 - amount) {
                        properties[property]! += amount
                    }
                    else {
                        properties[property]! = 100
                    }
                }
                else {
                    if properties[property]! > (amount) {
                        properties[property]! += amount
                    }
                    else {
                        properties[property]! = 0
                    }
                }
            
            
        }
    }
}
