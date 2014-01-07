package net.celestialdynamics.lynx.modules

import java.util.regex.Matcher
import java.util.regex.Pattern

import net.celestialdynamics.lynx.Roles.Usergroup

import org.springframework.dao.DataIntegrityViolationException

class PersonController {
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	static Random random = AccountController.random
	static String complexity = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})"

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
    }

    def create() {
        [personInstance: new Person(params)]
    }

    def save() {
		def addressInstance = new Address(params)
		if (!addressInstance.save(flush: true)) {
			addressInstance.save(flush: true)
		}
		addressInstance.save(flush: true)
		params.address = addressInstance
		
		
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
				params.account = accountInstance
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
		
		
		
		
        def personInstance = new Person(params)
        if (!personInstance.save(flush: true)) {
            render(view: "create", model: [personInstance: personInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
        redirect(action: "show", id: personInstance.id)
    }

    def show(Long id) {
        def personInstance = Person.get(id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
            return
        }

        [personInstance: personInstance]
    }

    def edit(Long id) {
        def personInstance = Person.get(id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
            return
        }

        [personInstance: personInstance]
    }

    def update(Long id, Long version) {
        def personInstance = Person.get(id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (personInstance.version > version) {
                personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'person.label', default: 'Person')] as Object[],
                          "Another user has updated this Person while you were editing")
                render(view: "edit", model: [personInstance: personInstance])
                return
            }
        }

        personInstance.properties = params

        if (!personInstance.save(flush: true)) {
            render(view: "edit", model: [personInstance: personInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
        redirect(action: "show", id: personInstance.id)
    }

    def delete(Long id) {
        def personInstance = Person.get(id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
            return
        }

        try {
            personInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'Person'), id])
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
	 

}
