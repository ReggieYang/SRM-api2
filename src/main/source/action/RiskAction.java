package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.DBConnection;
import model.Project;
import model.Risk;
import org.apache.struts2.ServletActionContext;
import service.ProjectService;
import service.RiskService;
import util.ServletUtils;
import util.Utils;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.util.Map;
import java.util.HashMap;

/**
 * Created by soleil on 16/11/9.
 */
public class RiskAction extends BaseAction {
    private String user;
    private String projectId;
    private Risk[] risks;
    private String[] participants;

    private String newRisk_description;
    private String newRisk_riskType;
    private String newRisk_possibility;
    private String newRisk_impact;
    private String newRisk_threshold;
    private String newRisk_followerName;

    private Map<String, Object> jsonResult;

    //get database connection
    Connection conn = DBConnection.getConnection();
    //instantiate a service with the connection
    RiskService rs = new RiskService(conn);
    ProjectService ps = new ProjectService(conn);

    public String toRisk() {
        user = getCurrentUser();
        if (user.equals("")) {
            return ERROR;
        } else {
            setRisks(rs.allRisk(getCurrentProjectId()));
            setParticipants(ps.allProjectDeveloper(getCurrentProjectId()));
            return SUCCESS;
        }
    }

    public String allRisk() {
        jsonResult = new HashMap<String, Object>();
        session.put("projectId", projectId);
        jsonResult.put("result", "success");
        return SUCCESS;
    }

    public String addRisk() {
        jsonResult = new HashMap<String, Object>();
        Risk newRisk = new Risk(Utils.NULL_ID(), newRisk_possibility, newRisk_impact, newRisk_threshold, getCurrentUser(), newRisk_followerName, newRisk_description, newRisk_riskType, Integer.parseInt(getCurrentProjectId()));
        rs.addRisk(Utils.object2Array(newRisk));
        jsonResult.put("result", "success");
        return SUCCESS;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public Risk[] getRisks() {
        return risks;
    }

    public void setRisks(Risk[] risks) {
        this.risks = risks;
    }

    public Map<String, Object> getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(Map<String, Object> jsonResult) {
        this.jsonResult = jsonResult;
    }

    public String getNewRisk_description() {
        return newRisk_description;
    }

    public void setNewRisk_description(String newRisk_description) {
        this.newRisk_description = newRisk_description;
    }

    public String getNewRisk_riskType() {
        return newRisk_riskType;
    }

    public void setNewRisk_riskType(String newRisk_riskType) {
        this.newRisk_riskType = newRisk_riskType;
    }

    public String getNewRisk_possibility() {
        return newRisk_possibility;
    }

    public void setNewRisk_possibility(String newRisk_possibility) {
        this.newRisk_possibility = newRisk_possibility;
    }

    public String getNewRisk_impact() {
        return newRisk_impact;
    }

    public void setNewRisk_impact(String newRisk_impact) {
        this.newRisk_impact = newRisk_impact;
    }

    public String getNewRisk_threshold() {
        return newRisk_threshold;
    }

    public void setNewRisk_threshold(String newRisk_threshold) {
        this.newRisk_threshold = newRisk_threshold;
    }

    public String getNewRisk_followerName() {
        return newRisk_followerName;
    }

    public void setNewRisk_followerName(String newRisk_followerName) {
        this.newRisk_followerName = newRisk_followerName;
    }

    public String[] getParticipants() {
        return participants;
    }

    public void setParticipants(String[] participants) {
        this.participants = participants;
    }
}
