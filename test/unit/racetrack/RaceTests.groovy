package racetrack

import grails.test.*

class RaceTests extends GrailsUnitTestCase {
   	void testSomething(){
		def race = new Race()
		race.startDateTime = null
		assertFalse(race.validate())

		def fieldError = race.errors.getFieldError('startDateTime')
		def validationError = fieldError.codes.find {it == 'race.startDateTime.validator.invalid' }
		assertNotNull(validationError)

	}
}
