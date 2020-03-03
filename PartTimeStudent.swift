//
//  PartTimeStudent.swift
//  gs-swift
//
//  Created by Senthilkumar Arumugam on 28/02/20.
//  Copyright © 2020 NA. All rights reserved.
//

import Foundation
class PartTimeStudent: Student{
    
    var noOfHoursAttended = Double()

    //function to calculate attendance from the no. of hours
    func calcTotalAttendance(partTimeStudent: PartTimeStudent){
        
        let attendance = (partTimeStudent.noOfHoursAttended/200) * 100
        partTimeStudent.percentOfAttendance = attendance
    }
    
}
