dataSource {
	pooled = true
	//dbCreate = "update"
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password = "antonio123"	
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
           dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/racetrack_dev"
        }
    }
    test {
        dataSource {
           // dbCreate = "update"
            url = "jdbc:mysql://localhost/racetrack_test"
        }
    }
    production {
        dataSource {
          //  dbCreate = "update"
            url = "jdbc:mysql:how//localhost/racetrack_prod"
        }
    }
}
