package model

import util.Utils

import scala.beans.BeanProperty

/**
  * Created by ReggieYang on 2016/11/6.
  */
case class Followup(@BeanProperty var followupId: Int = Utils.NULL_ID, @BeanProperty var status: String,
                    @BeanProperty var followupDate: String, riskId: Int)