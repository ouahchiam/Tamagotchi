//
//  main.swift
//  Tamagotchi
//
//  Created by Ouahchia, Mohamed (JD) on 17/11/2023.
//

import Foundation


let heartbeatInSeconds = 1.0
let pet = Tamagotchi(weight: 2)

print("Enter 1 to feed, 2 to defecate, 3 to discipline, 4 to output properties.")

func logic() async {
    while (true) {
        do {
            try await Task.sleep(nanoseconds: UInt64(heartbeatInSeconds * Double(NSEC_PER_SEC)))
            pet.heartbeat()
            let str = readLine()
            if str == "1" {
                pet.feed()
            }
            else if str == "2" {
                pet.defecate()
            }
            else if str == "3" {
                pet.discipline()
            }
            else if str == "4" {
                pet.outputProperties()
            }
        }
        catch {
            print("oops")
        }
    }
}

 await logic()
