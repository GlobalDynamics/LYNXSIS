package net.celestialdynamics.lynx.Roles

class Usergroup {
	String name
	String defaultGroup
	
	static mapping = {
		version false
		table 'usergroup'
		id column: 'usergroupID' , sqlType: "int"
		name column: 'name'
		defaultGroup column: 'defaultGroup'
	}
    static constraints = {
		name(blank:false,nullable:false,mazSize:100)
		defaultGroup(blank:false,nullable:false,mazSize:1)
    }
}
