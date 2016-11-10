package util

import java.io.StringWriter
import java.text.SimpleDateFormat
import java.util.Calendar

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.scala.DefaultScalaModule

/**
  * Created by ReggieYang on 2016/11/7.
  */
object Utils {

  lazy val EmptyString = ""

  lazy val NULL_ID = -1

  def toCamel(snack: String): String = {
    val terms = snack.toLowerCase().split("_")
    terms.reduceLeft(
      (acc: String, term: String) => acc + (term.head.toUpper + term.tail)
    )
  }

  def toSnack(camel: String): String = {
    val startWithLow = camel.head.toLower + camel.tail
    startWithLow.foldLeft("")((acc, c) => if (c.isUpper) acc + "_" + c.toLower else acc + c)
  }

  def getType(typeName: String) = {
    typeName match {
      case "int" => "int"
      case "double" => "double"
      case _ => "string"
    }
  }

  lazy val mapper = new ObjectMapper()
  mapper.registerModule(DefaultScalaModule)

  def serializeJson(o: Any): String = {
    val out = new StringWriter()
    mapper.writeValue(out, o)
    out.toString
  }

  def deserializeJson[T](json: String, cls: Class[T]) = mapper.readValue(json, cls)

  def object2Array(obj: Any): Array[String] = {
    obj.getClass.getDeclaredFields.map(x => {
      x.setAccessible(true)
      val value = x.get(obj)
      if ((x.getType == classOf[Int]) && (value.asInstanceOf[Int] == Utils.NULL_ID)) {
        Utils.EmptyString
      }
      else x.get(obj).toString
    })
  }

  def deserializeJson2Array[T](json: String, cls: Class[T]): Array[String] = object2Array(deserializeJson(json, cls))


  def deserializeJsonArray(json: String): Array[String] = mapper.readValue(json, classOf[Array[String]])

  def getCurrentTime: String = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime)

}
