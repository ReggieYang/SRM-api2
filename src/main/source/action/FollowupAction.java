//package action;
//
//import com.opensymphony.xwork2.ActionContext;
//import com.opensymphony.xwork2.ActionSupport;
//import dao.DBConnection;
//import model.Followup;
//import org.apache.struts2.ServletActionContext;
//import service.FollowupService;
//import service.UserService;
//import util.ServletUtils;
//import util.Utils;
//
//import javax.servlet.http.HttpServletRequest;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.util.HashMap;
//import java.util.Map;
//
///**
// * Created by soleil on 16/11/9.
// */
//public class FollowupAction extends BaseAction {
//    private String user;
//    private String riskId;
//    private Followup[] followups;
//
//    private Followup followup = new Followup(Utils.NULL_ID(), "", "", Utils.NULL_ID());
//
//    private String newFollowup_status;
//
//    private Map<String, Object> jsonResult;
//
//    //get database connection
//    Connection conn = DBConnection.getConnection();
//    //instantiate a service with the connection
//    FollowupService fs = new FollowupService(conn);
//
//    public String toFollowup() {
//        user = getCurrentUser();
//        if (user.equals("")) {
//            return ERROR;
//        } else {
//            setFollowups(fs.allFollowup(getCurrentRiskId()));
//            return SUCCESS;
//        }
//    }
//
//    public String allFollowup() {
//        jsonResult = new HashMap<String, Object>();
//        session.put("riskId", riskId);
//        jsonResult.put("result", "success");
//        return SUCCESS;
//    }
//
//    public String addFollowup() {
//        jsonResult = new HashMap<String, Object>();
//        Followup newFollowup = new Followup(Utils.NULL_ID(), newFollowup_status, Utils.getCurrentTime(), Integer.parseInt(getCurrentRiskId()));
//        fs.addFollowup(Utils.object2Array(newFollowup));
//        jsonResult.put("result", "success");
//        return SUCCESS;
//    }
//
//    public String deleteFollowup() {
//        jsonResult = new HashMap<String, Object>();
//        fs.deleteFollowup(Integer.toString(followup.getFollowupId()));
//        jsonResult.put("result", "success");
//        return SUCCESS;
//    }
//
//    public String getUser() {
//        return user;
//    }
//
//    public void setUser(String user) {
//        this.user = user;
//    }
//
//    public String getRiskId() {
//        return riskId;
//    }
//
//    public void setRiskId(String riskId) {
//        this.riskId = riskId;
//    }
//
//    public Followup[] getFollowups() {
//        return followups;
//    }
//
//    public void setFollowups(Followup[] followups) {
//        this.followups = followups;
//    }
//
//    public Map<String, Object> getJsonResult() {
//        return jsonResult;
//    }
//
//    public void setJsonResult(Map<String, Object> jsonResult) {
//        this.jsonResult = jsonResult;
//    }
//
//    public String getNewFollowup_status() {
//        return newFollowup_status;
//    }
//
//    public void setNewFollowup_status(String newFollowup_status) {
//        this.newFollowup_status = newFollowup_status;
//    }
//
//    public Followup getFollowup() {
//        return followup;
//    }
//
//    public void setFollowup(Followup followup) {
//        this.followup = followup;
//    }
//}
