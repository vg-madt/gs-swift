//
//  Course.swift
//  gs-swift
//
//  Created by Senthilkumar Arumugam on 29/02/20.
//  Copyright © 2020 NA. All rights reserved.
//

import Foundation
class Course{
    var name = String()
    var subjects = [Subject]()
    static var madt = Course()
    
    //course defined with subject objects
    init(){
        self.name = "MADT"
        self.subjects.append(Subject(name: "DBMS", credit: 3))
        self.subjects.append(Subject(name: "JAVA", credit: 3))
        self.subjects.append(Subject(name: "SWIFT", credit: 4))
        self.subjects.append(Subject(name: "IOS_FUNDAMENTALS", credit: 5))
        self.subjects.append(Subject(name: "ANDROID_FUNDAMENTALS", credit: 5))
        
    }

}
