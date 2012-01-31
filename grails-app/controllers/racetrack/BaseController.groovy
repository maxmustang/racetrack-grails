package racetrack

abstract class BaseController {
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def auth() {
		if(!session.userId){
			def originalRequestParams = [controller:controllerName, action:actionName]
			originalRequestParams.putAll(params)
			session.originalRequestParams = originalRequestParams
			redirect (controller:'user', action:'login')
			return false
		}
	}
}
