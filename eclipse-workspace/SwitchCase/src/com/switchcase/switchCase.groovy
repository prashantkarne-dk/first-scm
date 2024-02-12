package com.switchcase

class switchCase {
	static void main(args) {
		
		def fruit = "apple"
		
		switch (fruit) {
			case "apple":
				println("It's an apple.")
				break
			case "banana":
				println("It's a banana.")
				break
			case "orange":
				println("It's an orange.")
				break
			default:
				println("It's something else.")
		}
		
	}
}
