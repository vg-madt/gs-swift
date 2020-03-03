//
//  Student.swift
//  gs-swift
//
//  Created by Senthilkumar Arumugam on 28/02/20.
//  Copyright © 2020 NA. All rights reserved.
//

import Foundation
class Student{
    var id = String()
    var name = String()
    var gender = String()
    var emailId = String()
    var subjectMarks : [String:Evaluation] = [:]
    var course = Course.madt
    var gpa = Double()
    var percentOfAttendance = Double()
    
    init(id: String, name: String, gender: String, emailId: String){
        self.id = id
        self.name = name
        self.gender = gender
        self.emailId = emailId
    }
    //function to get marks for each subject for the student
    func getMarks(student: Student){
        print("")
        print("Enter marks for  \(student.name)")
        for i in 0..<student.course.subjects.count{
            let subjectName = student.course.subjects[i].name
            print("Enter the marks for \(subjectName)")
            let evaluation = Evaluation()
            student.subjectMarks[subjectName] = evaluation
            for (testName,value) in student.course.subjects[i].testWeight.pairs{
                print("Enter the marks for the \(testName)")
                let mark = Double(readLine()!)!
                print("")
                evaluation.pairs[testName] = mark * value
            }
        }
    }
    
    //function to calculate GPA
    func getGpa(student: Student){
        var credit = Double()
        var gpa = Double()
        var creditWeightage = Double()
        var totalCredits = Double()
        var totalWeightage = Double()
        var credits = [String:Int]()
        for subject in student.course.subjects {
            credits[subject.name] = subject.credit
        }
        for (subjectName, evaluation) in student.subjectMarks {
            var total = Double()
            for (_, marks) in evaluation.pairs {
                total += marks
            }
            print("Total for \(subjectName): \(total)")
            if total >= 94.0 && total <= 100.0{
                credit = 4.0
            }
            else if total >= 87.0 && total <= 93.0{
                credit = 3.7
            }
            else if total <= 86.0 && total >= 80.0{
                credit = 3.5
            }
            else if total <= 79.0 && total >= 77.0{
                credit = 3.2
            }
            else if total <= 76.0 && total >= 73.0{
                credit = 3.0
            }
            else if total <= 72.0 && total >= 70.0{
                credit = 2.7
            }
            else if total <= 69.0 && total >= 67.0{
                credit = 2.3
            }
            else if total <= 66.0 && total >= 63.0{
                credit = 2.0
            }
            else if total <= 62.0 && total >= 60.0{
                credit = 1.7
            }
            else if total <= 59.0 && total >= 50.0{
                credit = 1.0
            }
            else if total <= 49.0{
                credit = 0.0
            }
        
            creditWeightage = credit * Double(credits[subjectName]!)
            
            totalCredits = totalCredits + creditWeightage
            totalWeightage = totalWeightage + Double(credits[subjectName]!)
            
        }
        gpa = totalCredits/totalWeightage
        student.gpa = gpa
        
    }

    func equals(other: Student) -> Bool {
        return
            self.emailId == other.emailId &&
            self.gender == other.gender &&
            self.gpa == other.gpa &&
            self.id == other.id &&
            self.name == other.name &&
            self.percentOfAttendance == other.percentOfAttendance
    }
    
    //Sorts student according to GPA
    static func sortStudentAccordingToGpa(students: [Student]) -> [Student]{
        let sortedStudents = students.sorted{
            $0.gpa > $1.gpa
        }
        return sortedStudents
    }
    //Sorts students according to name
    static func sortStudentAccordingToName(students: [Student]) -> [Student]{
        let sortedStudentsByName = students.sorted{
            $0.name < $1.name
        }
        return sortedStudentsByName
    }
    //gets the failed students array
    static func failedStudents(students: [Student]) -> [Student]{
        var failedStudents = [Student]()
        for i in 0..<students.count{
            if students[i].gpa < 1.0{
                failedStudents.append(students[i])
            }
        }
        return failedStudents
    }
    //finds the student if exists
    static func findStudentByName(students: [Student], name: String) -> Student?{
        for i in 0..<students.count{
            if name == students[i].name{
                return students[i]
            }
        }
        return nil
    }
    //gets student marks
    static func getStudentMarks(partTimeStudents: inout[PartTimeStudent], fullTimeStudents: inout[Student], choice: Int){
            
        var flag = 1
        repeat{
        switch choice{
        case 1:
            for i in 0..<partTimeStudents.count{
                partTimeStudents[i].getMarks(student: partTimeStudents[i])
                partTimeStudents[i].getGpa(student: partTimeStudents[i])
                print("Enter the no. of hours hours attended for 200 hours")
                partTimeStudents[i].noOfHoursAttended = Double(readLine()!)!
                partTimeStudents[i].calcTotalAttendance(partTimeStudent: partTimeStudents[i])
            }
            flag = 0
            break
        case 2:
            for i in 0..<fullTimeStudents.count{
                fullTimeStudents[i].getMarks(student: fullTimeStudents[i])
                fullTimeStudents[i].getGpa(student: fullTimeStudents[i])
                print("ENter the percentage of attendance ")
                fullTimeStudents[i].percentOfAttendance = Double(readLine()!)!
            }
            flag = 0
            break
        default:
            print("Please enter a correct option")
        }
        }while flag == 1
        
    }
    //gets students details
    static func getStudentDetails(partTimeStudents: inout[PartTimeStudent], fullTimeStudents: inout[Student]){
        var flag = 1
        repeat {
        print("Enter the Student name")
        let name = readLine()!
        print("Enter the ID of the student")
        let id = readLine()!
        print("Enter the gender of the student")
        let gender = readLine()!
        print("Enter the emailID of the student")
        let emailId = readLine()!
        
        print("Is the student part time or full time?")
        print("1) Part time")
        print("2) Full time")
        let choice = Int(readLine()!)!
        switch choice{
        case 1:
            partTimeStudents.append(PartTimeStudent(id: id, name: name, gender: gender, emailId: emailId))
            break
        case 2:
            let fullTimeStudent = Student(id: id, name: name, gender: gender, emailId: emailId)
            fullTimeStudents.append(fullTimeStudent)
            break
        default:
            print("Details of students are entered")
            print("Going back to previous menu...")
            print()
            break
        }
        print("Enter 'E' for exit student addition")
            print("Enter any key for continue adding students")
            let menu = readLine()!
            if "E" == menu {
                flag = 0
            }
        } while (flag == 1)
        

        print("Add marks and attendance for the students and calculate their GPA")
        print("1) For part time and 2) for Full time students")
        let choice = Int(readLine()!)!
        getStudentMarks(partTimeStudents: &partTimeStudents, fullTimeStudents: &fullTimeStudents, choice: choice)
        if choice == 1 && fullTimeStudents.count > 0 {
            print("Would you want to enter marks for Full time ? ")
            print("Enter Y for yes, any other key to exit")
            if (readLine() == "Y") {
                getStudentMarks(partTimeStudents: &partTimeStudents, fullTimeStudents: &fullTimeStudents, choice: 2)
            }
        } else if choice == 2 && partTimeStudents.count > 0{
            print("Would you want to enter marks for Part time ?")
            print("Enter Y for yes, any other key to exit")
            if (readLine() == "Y") {
                getStudentMarks(partTimeStudents: &partTimeStudents, fullTimeStudents: &fullTimeStudents, choice: 1)
            }
        }
    }

    
}
