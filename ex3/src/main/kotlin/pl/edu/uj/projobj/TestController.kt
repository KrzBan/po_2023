package pl.edu.uj.projobj

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.HttpStatusCode
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody

@Controller
class TestController {

  @Autowired
  private lateinit var authorizationService: AuthorizationService

  val data = listOf<ResponseModel>(
    ResponseModel("Response 1", 1), ResponseModel("Another Response", 100), ResponseModel("Third Response", -500)
  )

  @GetMapping("/")
  fun getAllProducts(): ResponseEntity<List<ResponseModel>> {
    if(authorizationService.authorized())
      return ResponseEntity.ok(data)
    return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(emptyList())
  }

  @PostMapping("/login")
  fun login(@RequestBody loginRequest: LoginRequest): ResponseEntity<Boolean> {
    return ResponseEntity.ok(authorizationService.login(loginRequest.login, loginRequest.password))
  }

}