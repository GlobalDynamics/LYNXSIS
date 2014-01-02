package net.celestialdynamics.lynx.Roles

import org.springframework.dao.DataIntegrityViolationException

class UsergroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usergroupInstanceList: Usergroup.list(params), usergroupInstanceTotal: Usergroup.count()]
    }

    def create() {
        [usergroupInstance: new Usergroup(params)]
    }

    def save() {
        def usergroupInstance = new Usergroup(params)
        if (!usergroupInstance.save(flush: true)) {
            render(view: "create", model: [usergroupInstance: usergroupInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'usergroup.label', default: 'Usergroup'), usergroupInstance.id])
        redirect(action: "show", id: usergroupInstance.id)
    }

    def show(Long id) {
        def usergroupInstance = Usergroup.get(id)
        if (!usergroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usergroup.label', default: 'Usergroup'), id])
            redirect(action: "list")
            return
        }

        [usergroupInstance: usergroupInstance]
    }

    def edit(Long id) {
        def usergroupInstance = Usergroup.get(id)
        if (!usergroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usergroup.label', default: 'Usergroup'), id])
            redirect(action: "list")
            return
        }

        [usergroupInstance: usergroupInstance]
    }

    def update(Long id, Long version) {
        def usergroupInstance = Usergroup.get(id)
        if (!usergroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usergroup.label', default: 'Usergroup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usergroupInstance.version > version) {
                usergroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usergroup.label', default: 'Usergroup')] as Object[],
                          "Another user has updated this Usergroup while you were editing")
                render(view: "edit", model: [usergroupInstance: usergroupInstance])
                return
            }
        }

        usergroupInstance.properties = params

        if (!usergroupInstance.save(flush: true)) {
            render(view: "edit", model: [usergroupInstance: usergroupInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usergroup.label', default: 'Usergroup'), usergroupInstance.id])
        redirect(action: "show", id: usergroupInstance.id)
    }

    def delete(Long id) {
        def usergroupInstance = Usergroup.get(id)
        if (!usergroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usergroup.label', default: 'Usergroup'), id])
            redirect(action: "list")
            return
        }

        try {
            usergroupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usergroup.label', default: 'Usergroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usergroup.label', default: 'Usergroup'), id])
            redirect(action: "show", id: id)
        }
    }
}
