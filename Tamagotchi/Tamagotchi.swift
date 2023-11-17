//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Ouahchia, Mohamed (JD) on 17/11/2023.
//

import Foundation

class Tamagotchi {
    private var date: Date = Date()
    private var hunger: Int = 0
    private var bowels: Int = 0
    private var age: Int = 0
    private var weight: Double
    private var disciplineMeter: Int = 100 // descending
    private var attention = 0 // 100 being attention needed asap
    private var health = 100
    init(weight: Double) {
        self.weight = weight
    }
}
