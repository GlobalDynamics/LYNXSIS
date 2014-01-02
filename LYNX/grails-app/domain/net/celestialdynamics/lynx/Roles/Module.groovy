package net.celestialdynamics.lynx.Roles

class Module {
	String name
	
	static mapping ={
		version false
		table 'module'
		id column: 'moduleID' , sqlType: 'int'
		name column: 'name'
	}

    static constraints = {
		name(blank:false,nullable:false,mazSize:100)
    }
}
