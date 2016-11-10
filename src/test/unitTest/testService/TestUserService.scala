package testService

import dao.DBConnection
import org.scalatest.FunSuite
import service.UserService

/**
  * Created by ReggieYang on 2016/11/10.
  */
class TestUserService extends FunSuite{

  val userService = new UserService(DBConnection.getConnection)

  test("AddUser") {
    val user = Array("laowang", "123", "77777", "ebay123")
    userService.addUser(user)
  }

  test("VerifyUser") {
    println(userService.verifyUser("laowang", "77777"))
    println(userService.verifyUser("laowang", "77778"))
    println(userService.verifyUser("laow22ang", "77777"))
  }

  test("GetColleague") {
    userService.getColleague("eBay").foreach(x => println(x))
  }

}
