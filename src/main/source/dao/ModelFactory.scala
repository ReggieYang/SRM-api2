package dao

import model.{Followup, Project, Risk, User}
import util.Utils

/**
  * Created by ReggieYang on 2016/11/6.
  */
object ModelFactory {

  def createUser(user: Array[String]): User = {
    User(user(0), user(1), user(2), user(3))
  }

  def createProject(project: Array[String]): Project = {
    Project(project(0).toInt, project(1), project(2))
  }

  def createFollowup(followup: Array[String]): Followup = {
    Followup(followup(0).toInt, followup(1), followup(2), followup(3), followup(4), followup(5), followup(6),
      followup(7), followup(8), followup(9), followup(10).toInt, followup(11).toInt, followup(12).toInt)
  }

  def createRisk(risk: Array[String]): Risk = {
    Risk(risk(0).toInt, risk(1), risk(2), risk(3), risk(4), risk(5), risk(6), risk(7), risk(8), risk(9), risk(10).toInt, risk(11).toInt)
  }

  def getTableName(cls: Class[_]): String = cls.getSimpleName.toLowerCase

  def getFieldNames(cls: Class[_]): Array[String] = cls.getDeclaredFields.map(field => Utils.toSnack(field.getName))

  def getFieldTypes(cls: Class[_]): Array[String] = cls.getDeclaredFields.map(field => Utils.getType(field.getType.getSimpleName))

  def preProcessImportRisk(risk: Risk, newProjectId: String, creatorName: String): Risk = Risk(riskId = Utils.NULL_ID, possibility = risk.possibility, impact = risk.impact,
    threshold = risk.threshold, creatorName = creatorName, followerName = Utils.EmptyString, description = risk.description,
    riskType = risk.riskType, status = risk.status, updateTime = Utils.getCurrentTime, parentRiskId = risk.riskId, projectId = newProjectId.toInt)

}
