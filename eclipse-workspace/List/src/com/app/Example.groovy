package com.app

class Example {

        static void main(args) {
                // TODO Auto-generated method stub
                def list1 = [1,2,3,4,5]
				list1.add(60)
				list1.removeElement(1)
                //println("The full list is " + list1)
                //println("Index position 0 is " + list1[0])
                
                //def set1 = [1,2,2,2,2].toSet()
                //def set1 = [1,2,2,2,2].toSet()
                //println("The full set is " + set1)
                //println("Index position 2 is " + set1[2])
                //println("Index position 10 is " + list1[10])
                //println("Index position -1 is " + list1[-1])
                //println("Index position -5 is " + list1[-5])
                //println("Index position -6 is " + list1[-6])   //negative index starts from last element
                /*def dict1 = [
                        "name": "Sai",
                        "Name": "Jake"
                ]*/
                //println("The full dictionary is " + dict1)
                //println(dict1.age)
				
				for(int i = 0;i < list1.size(); i++) {
					println("Element at Index $i: ${list1[i]}")
				}
        }
}





