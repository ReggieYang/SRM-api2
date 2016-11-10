package model

import scala.beans.BeanProperty

/**
  * Created by ReggieYang on 2016/11/6.
  */
case class Followup(@BeanProperty var followupId: Int, @BeanProperty var status: String,
                    @BeanProperty var followupDate: String, riskId: Int)