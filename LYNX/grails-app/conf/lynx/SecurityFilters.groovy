package lynx

import net.celestialdynamics.lynx.modules.Account


class SecurityFilters {

    def filters = {
        all(controller:'*', action:"\\b(?!(login|authenticate)\\b)\\w+") {
            before = {
				Account user = session.user
				if(user != null)
				{
					return true
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
