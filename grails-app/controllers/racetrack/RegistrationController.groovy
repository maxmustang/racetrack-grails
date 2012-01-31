package racetrack

class RegistrationController extends BaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def beforeInterceptor = [action:this.&auth,	except:'register']
	
	def register = {
		def registration = new Registration()
		registration.properties = params
		if( request.method == 'GET'){
			def race = Race.get(params.id)
			return ['registration':registration, 'race':race]
		} else {
			if( registration.save() ){
				flash.message = "Sucesso no registro para ${registration.race.name}"
				redirect(controller:'race',action:'search')
			} else {
				def race = Race.get(params['race.id'])
				return ['registration':registration, 'race':race]
			}
		}
		
	}
	
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [registrationInstanceList: Registration.list(params), registrationInstanceTotal: Registration.count()]
    }

    def create = {
        def registrationInstance = new Registration()
        registrationInstance.properties = params
        return [registrationInstance: registrationInstance]
    }

    def save = {
        def registrationInstance = new Registration(params)
        if (registrationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'registration.label', default: 'Registration'), registrationInstance.id])}"
            redirect(action: "show", id: registrationInstance.id)
        }
        else {
            render(view: "create", model: [registrationInstance: registrationInstance])
        }
    }

    def show = {
        def registrationInstance = Registration.get(params.id)
        if (!registrationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
            redirect(action: "list")
        }
        else {
            [registrationInstance: registrationInstance]
        }
    }

    def edit = {
        def registrationInstance = Registration.get(params.id)
        if (!registrationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [registrationInstance: registrationInstance]
        }
    }

    def update = {
        def registrationInstance = Registration.get(params.id)
        if (registrationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (registrationInstance.version > version) {
                    
                    registrationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'registration.label', default: 'Registration')] as Object[], "Another user has updated this Registration while you were editing")
                    render(view: "edit", model: [registrationInstance: registrationInstance])
                    return
                }
            }
            registrationInstance.properties = params
            if (!registrationInstance.hasErrors() && registrationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'registration.label', default: 'Registration'), registrationInstance.id])}"
                redirect(action: "show", id: registrationInstance.id)
            }
            else {
                render(view: "edit", model: [registrationInstance: registrationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def registrationInstance = Registration.get(params.id)
        if (registrationInstance) {
            try {
                registrationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
            redirect(action: "list")
        }
    }
}
