package net.celestialdynamics.lynx.modules

class Student {
	Person person
	
	static mapping = {
		version false
		table 'student'
		id column: 'studentID' , sqlType: 'int'
		person column: 'personID', sqlType: 'int'
	}

    static constraints = {
		person(blank:false,nullable:false)
    }
}
