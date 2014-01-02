package net.celestialdynamics.lynx.modules

class Address {
	String street
	String zipcode
	String apt
	String houseNumber
	String direction
	String state 
	String city
	String phone
	String country
	String email
	
	
	static mapping = {
		version false
		table 'address'
		id column: 'addressID', sqlType: "int"
		street column: 'street'
		zipcode column: 'zipcode'
		apt column: 'apt'
		houseNumber column: 'house_no'
		direction column: 'direction'
		state column: 'state'
		city column: 'city'
		phone column: 'phone'
		country column: 'country'
		email column: 'email'
	}

    static constraints = {
		street(blank:false,nullable:false,mazSize:100)
		zipcode(blank:false,nullable:false,mazSize:10)
		apt(blank:false,nullable:false,mazSize:10)
		houseNumber(blank:false,nullable:false,mazSize:10)
		direction(blank:false,nullable:false,mazSize:1)
		state(blank:false,nullable:false,mazSize:15)
		city(blank:false,nullable:false,mazSize:20)
		phone(blank:false,nullable:false,mazSize:10)
		country(blank:false,nullable:false,mazSize:20)
		email(blank:false,nullable:false,mazSize:50)
    }
}
