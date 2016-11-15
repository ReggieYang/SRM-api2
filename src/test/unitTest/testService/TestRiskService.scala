package testService

import dao.DBConnection
import org.scalatest.FunSuite
import service.RiskService

/**
  * Created by ReggieYang on 2016/11/10.
  */
class TestRiskService extends FunSuite {

  val riskService = new RiskService(DBConnection.getConnection)

  //  test("GetRisk") {
  //    riskService.allRisk("123").foreach(x => println(x))
  //  }
  //
  //  //  test("AddRisk") {
  //  //    val risk = Array("", "a", "b", "c", "d", "e", "f", "g", "s", "2016-06-06", "1", "23")
  //  //    riskService.addRisk(risk)
  //  //  }
  //
  //  test("ModifyRisk") {
  //    val risk = Array("20", "a", "b", "c", "d", "e", "f", "g", "a", "2016-09-06", "1", "23")
  //    riskService.modifyRisk(risk)
  //  }
  //
  //  test("DeleteRisk") {
  //    riskService.deleteRisk("5")
  //  }

  test("getProblematicRisk") {
    riskService.getProblematicRisk().foreach(x => {
      println(x._1)
      println(x._2)
    })
  }

  test("getRiskByID") {
    println(riskService.getRiskById("8"))
  }

}
