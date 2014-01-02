package net.celestialdynamics.lynx.Roles

class Permission {
	Module module
	int accessType
	
	static mapping = {
		version false
		table 'permission'
		id column: 'permissionID' , sqlType: 'int'
		module column: 'moduleID', sqlType: 'int'
		accessType column: 'accessType', sqlType: 'int'
	}

    static constraints = {
		module(blank:false,nullable:false)
    }
}