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
        "attention": 0,
        "health": 100,
    ]
    let feedAmount: Double = 10
    let disciplineAmount: Double = 20
    private let debounces: [String: Double] = [ // debounce in seconds
        "discipline" : 20,
        "defecate" : 20,
    ]
    private var lastTriggered: [String: Double] = [
        "discipline": Date()
    ]
    
    init(weight: Double) {
        self.properties["weight"] = weight
    }
    
    func returnDiff(date1: Date, date2: Date) -> Double {
        return CFDateGetTimeIntervalSinceDate(date1, date2)
    }
    
    func feed() {
        if properties["hunger"]! > feedAmount {
            properties["hunger"]! -= feedAmount
        }
        else {
            properties["hunger"] = 0
        }
    }
    
    func defecate() {
        properties["bowels"] = 2
    }
    
    func discipline() {
        properties["discipline"]! += disciplineAmount
    }
}
