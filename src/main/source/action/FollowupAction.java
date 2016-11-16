package action;

import dao.DBConnection;
import model.Followup;
import model.Risk;

import service.FollowupService;
import service.ProjectService;
import service.RiskService;
import service.UserService;
import util.Utils;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by soleil on 16/11/9.
 */
public class FollowupAction extends BaseAction {
    private String user;
    private String position;
    private String riskId;
    private Followup[] followups;
    private String[] participants;
    private Risk currentRisk;
    private String follower;

    private String deleteFollowupId;

    private Followup newFollowup = new Followup(Utils.NULL_ID(), "", "", "", "", "", "", "", "", "", Utils.NULL_ID(), Utils.NULL_ID(), Utils.NULL_ID());

    private Map<String, Object> jsonResult;

    //get database connection
    Connection conn = DBConnection.getConnection();
    //instantiate a service with the connection
    FollowupService fs = new FollowupService(conn);
    RiskService rs = new RiskService(conn);
    ProjectService ps = new ProjectService(conn);
    UserService us = new UserService(conn);

    public String toFollowup() {
        user = getCurrentUser();
        if (user.equals("")) {
            return ERROR;
        } else {
            setPosition(us.getPosition(user));
            setFollowups(fs.allFollowup(getCurrentRiskId()));
            setCurrentRisk(rs.getRiskById(getCurrentRiskId()));
            setParticipants(ps.allProjectDeveloper(getCurrentProjectId()));
            setFollower(currentRisk.getFollowerName());
            return SUCCESS;
        }
    }

    public String allFollowup() {
        jsonResult = new HashMap<String, Object>();
        session.put("riskId", riskId);
        jsonResult.put("result", "success");
        return SUCCESS;
    }

    public String addFollowup() {
        jsonResult = new HashMap<String, Object>();
        setCurrentRisk(rs.getRiskById(getCurrentRiskId()));
        newFollowup.setRiskId(currentRisk.getRiskId());
        newFollowup.setProjectId(currentRisk.getProjectId());
        newFollowup.setParentRiskId(currentRisk.getParentRiskId());
        newFollowup.setUpdateTime(Utils.getCurrentTime());
        newFollowup.setCreatorName(currentRisk.getCreatorName());
        fs.addFollowup(Utils.object2Array(newFollowup));
        jsonResult.put("result", "success");
        return SUCCESS;
    }

    public String deleteFollowup() {
        jsonResult = new HashMap<String, Object>();
        fs.deleteFollowup(deleteFollowupId);
        jsonResult.put("result", "success");
        return SUCCESS;
    }

    public String getCurrentRiskInfo() {
        jsonResult = new HashMap<String, Object>();
        jsonResult.put("result", "success");
        jsonResult.put("currentRisk", rs.getRiskById(getCurrentRiskId()));
        return SUCCESS;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getRiskId() {
        return riskId;
    }

    public void setRiskId(String riskId) {
        this.riskId = riskId;
    }

    public Followup[] getFollowups() {
        return followups;
    }

    public void setFollowups(Followup[] followups) {
        this.followups = followups;
    }

    public Map<String, Object> getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(Map<String, Object> jsonResult) {
        this.jsonResult = jsonResult;
    }

    public String getDeleteFollowupId() {
        return deleteFollowupId;
    }

    public void setDeleteFollowupId(String deleteFollowupId) {
        this.deleteFollowupId = deleteFollowupId;
    }

    public Followup getNewFollowup() {
        return newFollowup;
    }

    public void setNewFollowup(Followup newFollowup) {
        this.newFollowup = newFollowup;
    }

    public String[] getParticipants() {
        return participants;
    }

    public void setParticipants(String[] participants) {
        this.participants = participants;
    }

    public Risk getCurrentRisk() {
        return currentRisk;
    }

    public void setCurrentRisk(Risk currentRisk) {
        this.currentRisk = currentRisk;
    }

    public String getFollower() {
        return follower;
    }

    public void setFollower(String follower) {
        this.follower = follower;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
