package model

import scala.beans.BeanProperty

/**
  * Created by ReggieYang on 2016/11/6.
  */


case class User(@BeanProperty var userName: String, @BeanProperty var position: String,
                @BeanProperty var password: String, @BeanProperty var company: String) {

}
