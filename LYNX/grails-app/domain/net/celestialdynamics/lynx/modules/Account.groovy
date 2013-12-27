package net.celestialdynamics.lynx.modules

class Account {
	String username
	String hash
	String salt
	Date lastLogin
	
	static mapping = {
		table 'accounts'
		id column: 'accountID'
		username column: 'username'
		hash column: 'hash'
		salt column: 'salt'
	}

    static constraints = {
		username(blank:false,mazSize:20)
		hash(blank:false,mazSize:500)
		salt(blank:false,mazSize:50)
    }
}
