package net.celestialdynamics.lynx.Roles

class UsergroupPermission {
	Usergroup usergroup
	Permission permission
	
	static mapping = {
		version false
		table 'usergroup_permission'
		id column: 'usergroup_permissionID' , sqlType: 'int'
		usergroup column: 'usergroupID', sqlType: 'int'
		permission column: 'permissionID', sqlType: 'int'
	}

    static constraints = {
		usergroup(blank:false,nullable:false)
		permission(blank:false,nullable:false)
    }
}
