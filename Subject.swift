//
//  Subject.swift
//  gs-swift
//
//  Created by Senthilkumar Arumugam on 28/02/20.
//  Copyright © 2020 NA. All rights reserved.
//

import Foundation
class Subject{
    var name = String()
    var credit = Int()
    var testWeight = Evaluation()
    
    init(name: String, credit: Int){
        self.name = name
        self.credit = credit
    }
    
    //gets evaluation criteria for each subject
    func getTestWeight(subject: Subject){
        print("")
        print("Getting evaluation criteria for  \(subject.name)")
        var sum = 0
        repeat {
            print("Enter the evaluation criteria name")
            let name = readLine()!
            print("Enter the weightage for the evaluation")
            let weight = Int(readLine()!)!
            if (sum + weight > 100) {
                print("Wrong weight, total weight exceeds 100")
                print("Maximum weight allowed: \(100 - sum)")
            } else {
                sum += weight
                let weightage = Double(weight)/100.0
                testWeight.pairs[name] = weightage
                subject.testWeight = testWeight
                print("Total expected weight: 100")
                print("Current weight: \(sum)")
                print("Remaining weight: \(100 - sum)")
            }
        } while sum < 100
    }
    
}


