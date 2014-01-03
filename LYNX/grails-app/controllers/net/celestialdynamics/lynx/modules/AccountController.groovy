package net.celestialdynamics.lynx.modules

import java.util.regex.Matcher
import java.util.regex.Pattern

import net.celestialdynamics.lynx.Roles.Permission
import net.celestialdynamics.lynx.Roles.Usergroup
import net.celestialdynamics.lynx.Roles.UsergroupPermission

import org.springframework.dao.DataIntegrityViolationException

class AccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static Random random = new Random();
	static String complexity = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})"

    def index() {
//       redirect(controller: "account", action: "index")
    }
	
	

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def person
        [accountInstanceList: Account.list(params), accountInstanceTotal: Account.count()]
    }

    def create() {
        [accountInstance: new Account(params)]
    }

    def save() {
		String password = params.password
		String passwordConfirm = params.passwordConfirm
		String username = params.username
		String usergroup = params.usergroup.id
		if(password && passwordConfirm && username)
		{
			if(complexityTest(password,passwordConfirm))
			{
				String salt = org.apache.commons.lang.RandomStringUtils.random(randInt(20,50), true, true)
				String hash  = encodePassword(password, salt)
				def accountInstance = new Account(username: username, hash: hash, salt : salt, usergroup: Usergroup.get(usergroup.toLong()))
				if (!accountInstance.save(flush: true)) {
					render(view: "create", model: [accountInstance: accountInstance])
					return
				}
				flash.message = message(code: 'default.created.message', args: [message(code: 'account.label', default: 'Account'), accountInstance.id])
				redirect(action: "show", id: accountInstance.id)
			}
			else
			{
				redirect(action: "create")
				return
			}
		}
		else
		{
			flash.message = "You must fill out all fields"
			redirect(action: "create")
			return
		}
		
		
		
    }

    def show(Long id) {
        def accountInstance = Account.get(id)
        if (!accountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
            return
        }

        [accountInstance: accountInstance]
    }

    def edit(Long id) {
        def accountInstance = Account.get(id)
        if (!accountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
            return
        }

        [accountInstance: accountInstance]
    }

    def update(Long id, Long version) {
        def accountInstance = Account.get(id)
        if (!accountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (accountInstance.version > version) {
                accountInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'account.label', default: 'Account')] as Object[],
                          "Another user has updated this Account while you were editing")
                render(view: "edit", model: [accountInstance: accountInstance])
                return
            }
        }

        accountInstance.properties = params

        if (!accountInstance.save(flush: true)) {
            render(view: "edit", model: [accountInstance: accountInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'account.label', default: 'Account'), accountInstance.id])
        redirect(action: "show", id: accountInstance.id)
    }

    def delete(Long id) {
        def accountInstance = Account.get(id)
        if (!accountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
            return
        }

        try {
            accountInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def encodePassword(String password, String hash)
	{
		int iterations = grailsApplication.config.grails.security.iterations
		String encodedPassword = password + hash
		for(int i = 0; i<=iterations;i++)
		{
			encodedPassword = (encodedPassword + hash).toString().encodeAsMD5();
		}
		return encodedPassword
	}
	
	def randInt(int min, int max) {
		
			// Usually this can be a field rather than a method variable
		
			// nextInt is normally exclusive of the top value,
			// so add 1 to make it inclusive
			int randomNum = random.nextInt((max - min) + 1) + min;
		
			return randomNum;
	}
	
	 def complexityTest(String password, String passwordConfirm) {
		if (password && passwordConfirm) {
			if (password.equals(passwordConfirm)) {
				Pattern pattern = Pattern.compile(complexity);
				Matcher matcher = pattern.matcher(password);
				if (matcher.matches()) {
					return true
				}

			}
			else
			{
				flash.message = "Passwords do not match"
				return false
			}
			flash.message = "Password is not complex enough. Password must be between 6 AND 20 characters"
			return false;
		}
		flash.message = "You must enter and confirm your passoword"
		return false
		
	}
	
	def login = {
		
	}
	def logout = {
		session.user = null
		session.permissions = null
		session.invalidate()
		redirect(controller:"account", action:"login")
	}
	
	def authenticate = {
		
		def accounts = Account.findAllByUsername(params.Username)
		if(accounts.size() == 1)
		{
			Account account = accounts.first()
			String password = params.password
			if(password != null && password != "" && password.length() >0)
			{
				String hash = encodePassword(password,account.salt)
				if(hash.equals(account.hash))
				{
					account.lastLogin = new Date()
					if (!account.save(flush: true)) {
						flash.message = "There was an error logging in"
						redirect(controller:"account", action:"login")
						return
					}
					def permissions = Permission.getAll(UsergroupPermission.findAllByUsergroup(account.usergroup)*.id)
					def people = Person.findAllByAccount(account)
					def person
					if(people.size() == 1)
					{
						person = people.first()
					}
					else if(people.size() == 0)
					{
						person = null
					}
					else
					{
						person = people.first()
					}
					session.user = account
					session.permissions = permissions
					session.person = person
					flash.clear()
					redirect(controller:"account", action:"index")
				}
				else
				{
					flash.message = "The password entered is incorrect"
					println "error 1"
					redirect(controller:"account", action:"login")
				}
			}
			else
			{
				flash.message = "You must enter a password"
				println "error 2"
				redirect(controller:"account", action:"login")
			}
		}
		else if(accounts.size() == 0)
		{
			flash.message = "You must enter a valid username"
			println "error 3"
			redirect(controller:"account", action:"login")
		}
		else if(accounts.size() >0)
		{
			flash.message = "error"
			redirect(controller:"account", action:"login")
		}
		
		
	}
}
