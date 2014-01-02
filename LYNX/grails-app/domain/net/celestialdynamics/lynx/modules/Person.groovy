package net.celestialdynamics.lynx.modules

class Person {
	Account account
	Address address
	String lastName
	String firstName
	String middleName
	String suffix
	String gender
	String birthDate
	String language
	String ethinicity
	
	static mapping = {
		version false;
		table : 'person'
		id column : 'personID', sqlType: "int"
		account column : 'accountID', sqlType: "int"
		address column : 'addressID', sqlType: "int"
		lastName column : 'lastName'
		firstName column : 'firstName'
		middleName column : 'middleName'
		suffix column : 'suffix'
		gender column : 'gender'
		birthDate column : 'birthDate', sqlType : 'date'
		language column : 'language'
		ethinicity column : 'ethinicity'
	}

    static constraints = {
		account(blank:false,nullable:false)
		address(blank:false,nullable:false)
		lastName(blank:false,nullable:false,mazSize:50)
		firstName(blank:false,nullable:false,mazSize:50)
		middleName(blank:false,nullable:false,mazSize:50)
		suffix(blank:false,nullable:false,mazSize:4)
		gender(blank:false,nullable:false,mazSize:1)
		birthDate(blank:false,nullable:false)
		language(blank:false,nullable:false,mazSize:15)
		ethinicity(blank:false,nullable:false,mazSize:20)
    }
}
