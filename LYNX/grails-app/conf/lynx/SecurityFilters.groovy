package lynx

import net.celestialdynamics.lynx.Roles.Permission
import net.celestialdynamics.lynx.modules.Account


class SecurityFilters {
	 def writeActions = ['save', 'create', 'edit', 'update','delete' ]
	 def readActions = [ 'list','show','index' ]
	
	
    def filters = {
        all(controller:'*', action:"\\b(?!(login|authenticate)\\b)\\w+") {
            before = {
				Account user = session.user
				if(user != null && session.permissions != null)
				{
					println controllerName
					if(writeActions.contains(actionName) || readActions.contains(actionName))
					{
						def permissions = session.permissions
						//permissions*.refresh()
						//println permissions*.module.action
						for(Permission p : permissions)
						{
							p.refresh()
							if(p.module.name.toString().equals(controllerName)
								&& p.module.action.toString().equals(actionName))
							{
								if(p.accessType == 1)
								{
									return true
								}
								else
								{
									flash.message = 'You do not have the permissions required to perform this action'
									redirect(uri: "/error")
									return false
								}
							}
						}
						flash.message = 'You do not have the permissions required to perform this action'
						redirect(uri: "/error")
						return false;
					}
				}
				else
				{
					redirect(controller:"account", action:"login")
					return false;
				}
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
