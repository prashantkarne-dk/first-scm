package com.app

class Student {
	def studentID
	def studentName
	
	static void main(args) {
		// TODO Auto-generated method stub
		Student student = new Student()
		student.studentName = "Harry"
		student.studentID = 1998
		println("Student ID is " + student.studentID)
		println("Student Name is " + student.studentName)
	}
}
