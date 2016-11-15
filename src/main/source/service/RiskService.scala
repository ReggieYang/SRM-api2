package service

import java.sql.Connection

import dao.{DaoFactory, ModelFactory, RiskDao}
import model.Risk
import util.Utils

/**
  * Created by ReggieYang on 2016/11/6.
  */
class RiskService(conn: Connection) {


  val riskDao = new RiskDao(conn)


  def addRisk(risk: Array[String]) = {
    DaoFactory.save(conn, riskDao.riskTable, risk.drop(1), riskDao.riskColumns.drop(1))
  }

  def deleteRisk(riskId: String) = {
    DaoFactory.delete(conn, riskDao.riskTable, riskDao.riskColumns.take(1), Array(riskId), riskDao.riskTypes.take(1))
  }

  def modifyRisk(risk: Array[String]) = {
    DaoFactory.updateByPK(conn, riskDao.riskTable, riskDao.riskColumns, risk, riskDao.riskTypes)
  }

  def allRisk(projectId: String): Array[Risk] = {
    riskDao.getRisk(projectId)
  }

  def getRiskById(riskId: String): Risk = riskDao.getRiskById(riskId)


  def getIdentifiedRisk(startTime: String = Utils.SYSTEM_INITIAL_TIME, endTime: String = Utils.getCurrentTime): Array[(Risk, String)] = {
    val sql = "select hot_parent.times, r2.* from risk r2, " +
      s"(select parent_risk_id, count(*) as times from risk r " +
      s"where r.update_time > \'$startTime\' and r.update_time < \'$endTime\'" +
      "group by r.parent_risk_id order by count(*) desc limit 10) as hot_parent " +
      "where r2.risk_id = hot_parent.parent_risk_id"
    getCertainRiskCount(sql)
  }

  private def getCertainRiskCount(sql: String): Array[(Risk, String)] = {
    DaoFactory.executeQuery(conn, sql, Array("times") ++ riskDao.riskColumns)
      .map(x => {
        (ModelFactory.createRisk(x.drop(1)), x.head)
      })
  }

  def getProblematicRisk(startTime: String = Utils.SYSTEM_INITIAL_TIME, endTime: String = Utils.getCurrentTime): Array[(Risk, String)] = {
    val sql = "select hot_parent.times, r2.* from risk r2, " +
      s"(select parent_risk_id, count(*) as times from risk r " +
      s"where r.update_time > \'$startTime\' and r.update_time < \'$endTime\'" +
      " and r.`status` = \'problem\'" +
      "group by r.parent_risk_id order by count(*) desc limit 10) as hot_parent " +
      "where r2.risk_id = hot_parent.parent_risk_id"
    getCertainRiskCount(sql)
  }

  def importRisk(riskId: Array[String], projectId: String) = {
    val risks = riskId.map(x => Utils.object2Array(ModelFactory.preProcessImportRisk(getRiskById(x), projectId)).drop(1))
    DaoFactory.saveBatch(conn, riskDao.riskTable, risks, riskDao.riskColumns.drop(1))
  }

}
