package testService

import dao.DBConnection
import org.scalatest.FunSuite
import service.FollowupService


/**
  * Created by ReggieYang on 2016/11/10.
  */
class TestFollwupService extends FunSuite{

  val followupService = new FollowupService(DBConnection.getConnection)

  test("AddFollowup") {
    val followup = Array("", "x", "2016-06-06", "133")
    followupService.addFollowup(followup)
  }

  test("ModifyFollowup") {
    val followup = Array("2", "xzzzz", "2016-06-06", "1233")
    followupService.modifyFollowup(followup)
  }
  test("AllFollowup") {
    followupService.allFollowup("123").foreach(x => println(x))
  }

  test("DeleteFollowup") {
    followupService.deleteFollowup("1")
  }




}
