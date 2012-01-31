package racetrack

import com.sun.net.ssl.internal.ssl.Alerts;

class RaceTagLib {
	def formatDate = { attr ->
		def date = attr.get('date')
		if(!date){
			date = new Date()
		}

		def format = attr.get('format')
		if(!format){
			format = "dd/MM/yyyy"
		}
		out << new java.text.SimpleDateFormat(format).format(date)
	}
	def formatNumber = { attrs ->
		def number = attrs.get('number')
		if (!number) {
			number = new Double(0)
		}
		def format = attrs.get('format')
		if (!format) {
			format = "0"
		}
		out << new java.text.DecimalFormat(format).format((Double)number)
	}

	def formatAge = { attrs, body ->
		def birthDay = attrs.get('birthDay')
		if( birthDay ){
			Date newDate = new Date()
			def year = null
			if( (newDate.month + 1) > (birthDay.month + 1) ){
				if( birthDay.day > newDate.month + 1 ){
					year = (newDate.year + 1900) - (birthDay.year + 1900)
				}else{
					year = ((newDate.year + 1900) - (birthDay.year + 1900)) - 1 
				}
			} else {
				year = ((newDate.year + 1900) - (birthDay.year + 1900)) - 1
			}
			out << year
		}
	}

	def emoticon = { attrs, body ->
		if( attrs.happy.equals('true')){
			out << ' :) '
		} else {
			out << ' :( '
		}
	}
}
