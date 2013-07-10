dataSource {
//    pooled = true
//    driverClassName = "com.mysql.jdbc.Driver"
//    username = "root"
//    password = ""

    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "qpalzm12qpalzm98"
    dialect = org.hibernate.dialect.PostgreSQLDialect
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"

//            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:mysql://localhost/twitter?useUnicode=yes&characterEncoding=UTF-8"

            dbCreate = "update"
            url = "jdbc:postgresql://localhost:5432/ideamachine"

        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            pooled = true
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis = 1800000
                timeBetweenEvictionRunsMillis = 1800000
                numTestsPerEvictionRun = 3
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = true
                validationQuery = "SELECT 1"
            }
        }
    }
//    production {
//        def envVar = System.env.VCAP_SERVICES
//        def credentials = envVar ? grails.converters.JSON.parse(envVar)["mysql-5.1"][0]["credentials"] : null
//        dataSource {
//            pooled = true
//            dbCreate = "update"
//            driverClassName = "com.mysql.jdbc.Driver"
//            url = credentials ? "jdbc:mysql://${credentials.hostname}:${credentials.port}/${credentials.name}?useUnicode=yes&characterEncoding=UTF-8" : ""
//            username = credentials ? credentials.username : ""
//            password = credentails ? credentials.password : ""
//        }
//    }

}
