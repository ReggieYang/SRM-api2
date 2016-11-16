package testService

import dao.DBConnection
import org.scalatest.FunSuite
import service.FollowupService


/**
  * Created by ReggieYang on 2016/11/10.
  */
class TestFollwupService extends FunSuite{

  val followupService = new FollowupService(DBConnection.getConnection)

//  test("AddFollowup") {
//    val followup = Array("20", "a", "b", "c", "d", "e", "f", "g", "a", "2016-09-06", "1", "23", "78")
//    followupService.addFollowup(followup)
//  }
//
//  test("ModifyFollowup") {
//    val followup = Array("20", "a", "b", "c", "d", "e", "f", "g", "a", "2016-09-22", "1", "23999", "78")
//    followupService.modifyFollowup(followup)
//  }
  test("AllFollowup") {
    followupService.allFollowup("8").foreach(x => println(x))
  }

  test("DeleteFollowup") {
//    followupService.deleteFollowup("1")
  }




}
