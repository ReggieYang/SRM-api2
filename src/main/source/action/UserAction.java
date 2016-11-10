package action;

import bean.ResultMessage;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.DBConnection;
import model.User;
import org.apache.struts2.ServletActionContext;
import service.UserService;
import util.ServletUtils;
import util.Utils;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.util.Map;
import java.util.HashMap;

/**
 * Created by soleil on 16/11/9.
 */
public class UserAction extends BaseAction{
    private String userName;
    private String password;
    private User newUser;

    private String newUser_userName;
    private String newUser_password;
    private String newUser_company;
    private String newUser_position;

    private Map<String, Object> jsonResult;

    //get database connection
    Connection conn = DBConnection.getConnection();
    //instantiate a service with the connection
    UserService us = new UserService(conn);

    public String log() {
        jsonResult = new HashMap<String, Object>();
        ResultMessage rm = us.verifyUser(userName, password);
        if (rm.result().equals("success")) {
            session.put("user", userName);
        }
        jsonResult.put("result", rm.result());
        jsonResult.put("message", rm.message());
        return SUCCESS;
    }

    public String register() {
        jsonResult = new HashMap<String, Object>();
        newUser = new User(newUser_userName, newUser_position, newUser_password, newUser_company);
        us.addUser(Utils.object2Array(newUser));
        session.put("user", newUser_userName);
        jsonResult.put("result", "success");
        return SUCCESS;
    }

//    //添加用户
//    public void addUser() {
//        us.addUser(Utils.deserializeJson2Array(getUser(), User.class));
//    }
//
//    //获取同事列表
//    public void getColleague() throws Exception{
//        ActionContext context = ActionContext.getContext();
//        HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
//        setCompany(request.getParameter("company"));
//        setColleagueList(Utils.serializeJson(us.getColleague(getCompany())));
//        ServletUtils.sendResponse(colleagueList);
////        setColleagueList(Utils.serializeJson(us.getColleague("eBay")));
////        ProjectAction test = new ProjectAction();
////        test.print(colleagueList);
//    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Map<String, Object> getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(Map<String, Object> jsonResult) {
        this.jsonResult = jsonResult;
    }

    public User getNewUser() {
        return newUser;
    }

    public void setNewUser(User newUser) {
        this.newUser = newUser;
    }

    public String getNewUser_userName() {
        return newUser_userName;
    }

    public void setNewUser_userName(String newUser_userName) {
        this.newUser_userName = newUser_userName;
    }

    public String getNewUser_password() {
        return newUser_password;
    }

    public void setNewUser_password(String newUser_password) {
        this.newUser_password = newUser_password;
    }

    public String getNewUser_company() {
        return newUser_company;
    }

    public void setNewUser_company(String newUser_company) {
        this.newUser_company = newUser_company;
    }

    public String getNewUser_position() {
        return newUser_position;
    }

    public void setNewUser_position(String newUser_position) {
        this.newUser_position = newUser_position;
    }
}
