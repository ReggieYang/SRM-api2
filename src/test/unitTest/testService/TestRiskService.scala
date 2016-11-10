package testService

import dao.DBConnection
import org.scalatest.FunSuite
import service.RiskService

/**
  * Created by ReggieYang on 2016/11/10.
  */
class TestRiskService extends FunSuite{

  val riskService = new RiskService(DBConnection.getConnection)

  test("GetRisk") {
    riskService.allRisk("123").foreach(x => println(x))
  }

  test("AddRisk") {
    val risk = Array("", "a", "b", "c", "d", "e", "f", "g", "999")
    riskService.addRisk(risk)
  }

  test("ModifyRisk") {
    val risk = Array("2", "a", "b", "c", "d", "e", "f", "g", "999")
    riskService.modifyRisk(risk)
  }

  test("DeleteRisk") {
    riskService.deleteRisk("5")
  }

}
