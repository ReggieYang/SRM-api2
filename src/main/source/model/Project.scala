package model

import scala.beans.BeanProperty

/**
  * Created by ReggieYang on 2016/11/6.
  */

case class Project(@BeanProperty var projectId: Int, @BeanProperty var projectName: String, @BeanProperty var creatorName: String)

