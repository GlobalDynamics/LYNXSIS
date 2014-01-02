package net.celestialdynamics.lynx.Roles

class Module {
	String name
	String action
	
	static mapping ={
		version false
		table 'module'
		id column: 'moduleID' , sqlType: 'int'
		name column: 'name'
		action column: 'action'
	}

    static constraints = {
		name(blank:false,nullable:false,mazSize:100)
		action(blank:false,nullable:false,mazSize:50)
    }
}
