package com.app

class Example {
	static void main(String[] args) {
	   Student student = new Student(1,60);
	   student.DisplayMarks();
	}
 }
  
 interface Marks {
	void DisplayMarks();
 }
  
 class Student implements Marks {
	int StudentID
	int Marks;
	Student(int ID,int marks){
			this.StudentID=ID
			this.Marks=marks
	}
	public int getStudentID() {
		return StudentID;
	}
	public void setStudentID(int studentID) {
		StudentID = studentID;
	}
	public int getMarks() {
		return Marks;
	}
	public void setMarks(int marks) {
		Marks = marks;
	}
	void DisplayMarks() {
		println("Your Marks are\n" + this.Marks);
		if(this.getMarks() >= 60) {
			println("Congratulations !!! Your are passed :) ")
		}
		else {
			println("Oops :( , Better luck next time ");
		}
	}
 }