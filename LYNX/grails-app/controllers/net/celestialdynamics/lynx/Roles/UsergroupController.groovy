package net.celestialdynamics.lynx.Roles

import org.springframework.dao.DataIntegrityViolationException

class UsergroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usergroupInstanceList: Usergroup.list(params), usergroupInstanceTotal: Usergroup.count() ]
    }

    def create() {
		def moduleList = Module.list().unique{ it.name }
		
        [usergroupInstance: new Usergroup(params), moduleList: moduleList]
    }

    def save() {
        def usergroupInstance = new Usergroup(params)
        usergroupInstance.save(flush: true)
            
		for (e in params)
		{
			String key = e.getKey()
			String value = e.getValue()
			if(!key.contains("_"))
			{
				if(key.contains("Create") )
				{
					String moduleName = key.replace("Create", "")
					def createModules = Module.findAllByNameAndAction(moduleName,"create")
					def saveModules = Module.findAllByNameAndAction(moduleName,"save")
					if(createModules.size() > 0 && saveModules.size() > 0)
					{
						def create = createModules.first()
						def save = saveModules.first()
						createPermission(create, "1", usergroupInstance)
						createPermission(save, "1", usergroupInstance)
					}
					else
					{
						flash.message = "Module does not exist."
						render(view: "create", model: [usergroupInstance: usergroupInstance])
					}
					
				}
				else if(key.contains("Update"))
				{
					String moduleName = key.replace("Update", "")
					def editModules = Module.findAllByNameAndAction(moduleName,"edit")
					def updateModules = Module.findAllByNameAndAction(moduleName,"update")
					if(editModules.size() > 0 && updateModules.size() > 0)
					{
						def edit = editModules.first()
						def update = updateModules.first()
						
						createPermission(edit, "1", usergroupInstance)
						createPermission(update, "1", usergroupInstance)
					}
					else
					{
						flash.message = "Module does not exist."
						render(view: "create", model: [usergroupInstance: usergroupInstance])
					}
					println "update"
					
				}
				else if(key.contains("View"))
				{
					println "view"
					String moduleName = key.replace("View", "")
					def indexModules = Module.findAllByNameAndAction(moduleName,"index")
					def listModules = Module.findAllByNameAndAction(moduleName,"list")
					def showModules = Module.findAllByNameAndAction(moduleName,"show")
					if(indexModules.size() > 0 && listModules.size() > 0 && showModules.size() > 0)
					{
						def index = indexModules.first()
						def list = listModules.first()
						def show = showModules.first()
						
						createPermission(index, "1", usergroupInstance)
						createPermission(list, "1", usergroupInstance)
						createPermission(show, "1", usergroupInstance)
					}
					else
					{
						flash.message = "Module does not exist."
						render(view: "create", model: [usergroupInstance: usergroupInstance])
					}
				}
				else if(key.contains("Delete"))
				{
					println "delete"
					String moduleName = key.replace("Delete", "")
					def deleteModules = Module.findAllByNameAndAction(moduleName,"index")
					if(deleteModules.size() > 0)
					{
						def delete = deleteModules.first()
						createPermission(delete, "1", usergroupInstance)
					}
					else
					{
						flash.message = "Module does not exist."
						render(view: "create", model: [usergroupInstance: usergroupInstance])
					}
				}
			}
		
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
	
	def createPermission(Module module, String accessType, Usergroup usergroup)
	{
		def permission = new Permission(module: module, accessType: accessType)
		permission.save(flush:true)
		def usergroupPermission = new UsergroupPermission(usergroup:usergroup,permission:permission)	
		usergroupPermission.save(flush:true)
	}
}
