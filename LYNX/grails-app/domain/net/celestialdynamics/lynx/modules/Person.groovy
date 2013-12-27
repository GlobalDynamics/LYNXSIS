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
		table : 'person'
		id column : 'personID'
		account column : 'accountID'
		address column : 'addressID'
		lastName column : 'lastName'
		firstName column : 'firstName'
		middleName column : 'middleName'
		suffix column : 'suffix'
		gender column : 'gender'
		birthDate column : 'birthDate'
		language column : 'language'
		ethinicity column : 'ethinicity'
	}

    static constraints = {
		account(blank:false)
		address(blank:false)
		lastName(blank:false,mazSize:50)
		firstName(blank:false,mazSize:50)
		middleName(blank:false,mazSize:50)
		suffix(blank:false,mazSize:4)
		gender(blank:false,mazSize:1)
		birthDate(blank:false)
		language(blank:false,mazSize:15)
		ethinicity(blank:false,mazSize:20)
    }
}
