package testService

import dao.DBConnection
import org.scalatest.FunSuite
import service.ProjectService

/**
  * Created by ReggieYang on 2016/11/10.
  */
class TestProjectService extends FunSuite {

  val projectService = new ProjectService(DBConnection.getConnection)

    test("AddDeveloper") {
      projectService.addDeveloper("zzz", "999")
    }

  //  test("DeleteDeveloper") {
  //    projectService.deleteDeveloper("ggg", "132")
  //  }

//  test("GetDeveloper") {
//    projectService.allProjectDeveloper("123").foreach(x => println(x))
//  }

//  test("GetProject") {
//    projectService.allProject("ReggieYang").foreach(x => println(x))
//  }
//
//  test("AddProject") {
//    val project = Array("", "kkk" ,"ppp")
//    projectService.addProject(project)
//    val project2 = Array("", "kkk22" ,"ppp22")
//    projectService.addProject(project2)
//  }

//  test("ModifyProject") {
//    val project = Array("123", "gggg" ,"ppp")
//    projectService.modifyProject(project)
//  }

//  test("DeleteProject") {
//    projectService.deleteProject("125")
//  }

}
