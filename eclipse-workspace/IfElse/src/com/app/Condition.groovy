package com.app

class Condition {
	
       static void main(args) {
                // TODO Auto-generated method stub
                def num1 = 150
                def name = "Prashant"
                if(num1 == 150 && name == "Prashant") {                 // && is and condition
                        println("num1 is equal to 150 and name is Prashant")
                }
                else if(num1 < 150 && name == "Prashant") {                 // || is or condition
                        println("num1 is less than 150")
                }
                else {
                        println("num1 is greater than 150")
                }
        }
}

