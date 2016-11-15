package model

import util.Utils

import scala.beans.BeanProperty

/**
  * Created by ReggieYang on 2016/11/6.
  */
case class Risk(@BeanProperty var riskId: Int = Utils.NULL_ID, @BeanProperty var possibility: String, @BeanProperty var impact: String,
                @BeanProperty var threshold: String, @BeanProperty var creatorName: String, @BeanProperty var followerName: String,
                @BeanProperty var description: String, @BeanProperty var riskType: String, @BeanProperty var status: String,
                @BeanProperty var updateTime: String, @BeanProperty var parentRiskId: Int, @BeanProperty var projectId: Int)