package racetrack

import racetrack.java.RaceQuery




class RaceController extends BaseController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def beforeInterceptor = [action:this.&auth,except:['search']]

	
	def search = {
		/*if (request.method == 'POST') {
		 render(view:'list', model:[ raceInstanceList: Race.findAllByCityLikeAndStateLike('%' + params.city + '%',
		 '%' + params.state + '%' ) ])
		 } else {
		 render(view:'search', model:[states: Race.constraints.state.inList])
		 }
		 if (request.method == 'POST' ) {
		 def criteria = Race.createCriteria()
		 def results = criteria {
		 and {
		 like('city', '%' + params.city + '%')
		 like('state', '%' + params.state + '%')
		 }
		 }
		 render(view:'list', model:[ raceInstanceList: results ])
		 } */


		if (request.method == 'POST' ){
			println "Entrei aqui"
			RaceQuery query = new RaceQuery()
			bindData(query, params)
			def criteria = Race.createCriteria()
			def results = criteria {
				and {
					like('city', '%' + query.city + '%')
					like('state', '%' + query.state + '%')
					if (query.distance) {
						switch (query.distanceOperator) {
							case RaceQuery.DistanceOperator.AT_LEAST:
								ge('distance', query.distance)
								break
							case RaceQuery.DistanceOperator.EXACTLY:
								eq('distance', query.distance)
								break
							case RaceQuery.DistanceOperator.AT_MOST:
								le('distance', query.distance)
								break
							default:
								log.error "Found unexpected value for distance"
								+ " operator - ${query.distanceOperator}"
						}
					}
					between('startDateTime' , query.minDate , query.maxDate + 1)
				}
			}	
			render(view:'searchresults', model:[ raceInstanceList: results ])
		} else {
			render(view:'search', model:[ states: Race.constraints.state.inList])
		}
	}

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[raceInstanceList: Race.list(params), raceInstanceTotal: Race.count()]
	}

	def create = {
		def raceInstance = new Race()
		raceInstance.properties = params
		return [raceInstance: raceInstance]
	}

	def save = {
		def raceInstance = new Race(params)
		if (raceInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])}"
			redirect(action: "show", id: raceInstance.id)
		}
		else {
			render(view: "create", model: [raceInstance: raceInstance])
		}
	}

	def show = {
		def raceInstance = Race.get(params.id)
		if (!raceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
			redirect(action: "list")
		}
		else {
			[raceInstance: raceInstance]
		}
	}

	def edit = {
		def raceInstance = Race.get(params.id)
		if (!raceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [raceInstance: raceInstance]
		}
	}

	def update = {
		def raceInstance = Race.get(params.id)
		if (raceInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (raceInstance.version > version) {

					raceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'race.label', default: 'Race')]
					as Object[], "Another user has updated this Race while you were editing")
					render(view: "edit", model: [raceInstance: raceInstance])
					return
				}
			}
			raceInstance.properties = params
			if (!raceInstance.hasErrors() && raceInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])}"
				redirect(action: "show", id: raceInstance.id)
			}
			else {
				render(view: "edit", model: [raceInstance: raceInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def raceInstance = Race.get(params.id)
		if (raceInstance) {
			try {
				raceInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
			redirect(action: "list")
		}
	}
}
