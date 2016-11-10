package model

import scala.beans.BeanProperty

/**
  * Created by ReggieYang on 2016/11/6.
  */
case class Risk(@BeanProperty var riskId: Int, @BeanProperty var possibility: String, @BeanProperty var impact: String,
                @BeanProperty var threshold: String, @BeanProperty var creatorName: String, @BeanProperty var followerName: String,
                @BeanProperty var description: String, @BeanProperty var riskType: String, @BeanProperty var projectId: Int)