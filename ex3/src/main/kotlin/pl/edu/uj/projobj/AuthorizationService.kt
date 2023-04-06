package pl.edu.uj.projobj

import org.springframework.stereotype.Service

@Service
class AuthorizationService {

    var login: String = "login"
    var password: String = "password"
    var loggedIn: Boolean = false

    fun login(userLogin: String, userPassword: String): Boolean {
        loggedIn = login.equals(userLogin) && password.equals(userPassword)
        return loggedIn
    }

    fun authorized(): Boolean {
        return loggedIn
    }
}