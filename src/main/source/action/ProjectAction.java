package action;

import bean.ResultMessage;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.DBConnection;
import model.Project;
import model.User;
import org.apache.struts2.ServletActionContext;
import service.ProjectService;
import service.UserService;
import util.ServletUtils;
import util.Utils;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by soleil on 16/11/9.
 */
public class ProjectAction extends BaseAction {
    private String user;
    private Project[] projects;
    private String position;

    private String newProject_projectName;

    private Map<String, Object> jsonResult;

    //get database connection
    Connection conn = DBConnection.getConnection();
    //instantiate a service with the connection
    ProjectService ps = new ProjectService(conn);
    UserService us = new UserService(conn);

    public String toProject() {
        user = getCurrentUser();
        if (user.equals("")) {
            return ERROR;
        } else {
            setProjects(ps.allProject(user));
            setPosition(us.getPosition(user));
            return SUCCESS;
        }
    }

    public String addProject() {
        jsonResult = new HashMap<String, Object>();
        Project newProject = new Project(Utils.NULL_ID(), newProject_projectName, getCurrentUser());
        ps.addProject(Utils.object2Array(newProject));
        jsonResult.put("result", "success");
        return SUCCESS;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Project[] getProjects() {
        return projects;
    }

    public void setProjects(Project[] projects) {
        this.projects = projects;
    }

    public String getNewProject_projectName() {
        return newProject_projectName;
    }

    public void setNewProject_projectName(String newProject_projectName) {
        this.newProject_projectName = newProject_projectName;
    }

    public Map<String, Object> getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(Map<String, Object> jsonResult) {
        this.jsonResult = jsonResult;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
