package net.celestialdynamics.lynx.modules

import net.celestialdynamics.lynx.Roles.Usergroup

class Account {
	Usergroup usergroup
	String username
	String hash
	String salt
	Date lastLogin
	
	static mapping = {
		version false
		table 'account'
		id column: 'accountID' , sqlType: 'int'
		usergroup column: 'usergroupID', sqlType: 'int'
		username column: 'username'
		hash column: 'hash'
		salt column: 'salt'
		lastLogin column: 'lastLogin', sqlType : 'date'
	}

    static constraints = {
		username(blank:false,nullable:false,mazSize:20)
		usergroup(blank:false,nullable:false)
		hash(blank:false,nullable:false,mazSize:500)
		salt(blank:false,nullable:false,mazSize:50)
		lastLogin(nullable:true)
    }
}
