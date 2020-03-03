//
//  main.swift
//  gs-swift
//
//  Created by Senthilkumar Arumugam on 27/02/20.
//  Copyright © 2020 NA. All rights reserved.
//

import Foundation


var partTimeStudents = [PartTimeStudent]()
var fullTimeStudents = [Student]()

//Gets the eligibility of Scholarship to a student
enum Scholarships: Int{
    case Class_Topper_Scholarship = 500
    case Women_Techmaker_Scholarship = 300
    case Full_Attendance_Scholarship = 100

    static let names = [Class_Topper_Scholarship, Women_Techmaker_Scholarship, Full_Attendance_Scholarship]
    //function to find eligibility
    
    func findEligibility(student: Student, students: [Student]) -> Bool {
        switch self {
        case .Class_Topper_Scholarship:
            let topper = Student.sortStudentAccordingToGpa(students:students)
            return topper[0].equals(other:student)
        case .Full_Attendance_Scholarship:
            return student.percentOfAttendance == 100
        case .Women_Techmaker_Scholarship:
            return student.gender == "Female"
        }
    }
}

print("Enter the Evaluation criteria for each subject")
for i in 0..<Course.madt.subjects.count{
    let subject = Course.madt.subjects[i]
    subject.getTestWeight(subject: subject)
}

//add student details
print("Entering student details and marks")
Student.getStudentDetails(partTimeStudents: &partTimeStudents, fullTimeStudents: &fullTimeStudents)

var flag = 1
// user menu
repeat{
    
print("Perform actions for part time or full time")
print("1) part time")
print("Any other number for full time")
var choice = Int(readLine()!)!
var studentVar = [Student]()
if choice == 1{
    studentVar = partTimeStudents
}
else{
    studentVar = fullTimeStudents
}
print("1) Find the student by name if exists, and print the GPA and total attendance")
print("2) Sort all students by name and display their, GPA and attendance")
print("3) Sort students by GPA and display the top 5 rank holders")
print("4) Display the list of failed students")
print("5) Enter the student name to find what scholarship the student gets")
print("6) Add new Student")
print("Press 0 to exit the system")

choice = Int(readLine()!)!

switch choice{
case 1:
    print("Enter the name of the student")
    let name = readLine()!
    let student = Student.findStudentByName(students: studentVar, name: name)
    if (student == nil) {
        print("Student not found")
    } else {
        print("Student is found")
        print("The ID of the student is \(student!.id)")
        print("The GPA of the student is \(student!.gpa)")
        print("The attendance of the student is \(student!.percentOfAttendance)")
    }
    flag = 1
    break
    
case 2:
    print("Sorted by Name")
    let sortedStudents = Student.sortStudentAccordingToName(students: studentVar)
    for i in 0..<sortedStudents.count{
        print("Name: \(sortedStudents[i].name)  ID: \(sortedStudents[i].id)   GPA: \(sortedStudents[i].gpa)  Attendance: \(sortedStudents[i].percentOfAttendance)%")
    }
    flag = 1
    break

case 3:
    print("Top 5 rank holders")
    let sortedStudents = Student.sortStudentAccordingToGpa(students: studentVar)
    for i in 0..<sortedStudents.count{
        print("Rank \(i+1)  Name: \(sortedStudents[i].name)  ID: \(sortedStudents[i].id)  GPA: \(sortedStudents[i].gpa)")
    }
    flag = 1
    break
case 4:
    print("Students who have failed")
    let failedStudents = Student.failedStudents(students: studentVar)
    for i in 0..<failedStudents.count{
        print("Name: \(failedStudents[i].name)  GPA: \(failedStudents[i].gpa)")
    }
    flag = 1
    break
    
case 5:
    print("Enter the name of the student")
    let name = readLine()!
    let student = Student.findStudentByName(students: studentVar, name: name)
    if student == nil {
        print("Student not found")
    }
    else {
        var scholarships = [Scholarships]()
        for scholarship in Scholarships.names {
            let eligible = scholarship.findEligibility(student: student!, students: studentVar)
            if eligible == true {
                scholarships.append(scholarship)
            }
        }
        print("Eligible scholarship for \(name): ")
        for scholarship in scholarships {
            print("\(scholarship) \(scholarship.rawValue)")
        }
    }
    break
case 6:
    Student.getStudentDetails(partTimeStudents: &partTimeStudents, fullTimeStudents: &fullTimeStudents)
    break
case 0:
    print("Exiting the system... Thank you")
    flag = 0
    break
default:
    print("Enter a valid choice")
    flag = 1
}
} while flag == 1
