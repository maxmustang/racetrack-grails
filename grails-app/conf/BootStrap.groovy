import racetrack.User

class BootStrap {

    def init = { servletContext ->
	final String BACKUP_ADMIN = "admin"
		if( !User.findByUserId(BACKU_ADMIN) ){
		new User(userId:BACKUP_ADMIN,password:'password').save()
		}
    }
    def destroy = {
    }
}
