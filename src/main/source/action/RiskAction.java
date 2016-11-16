package action;

import dao.DBConnection;
import model.Risk;
import service.ProjectService;
import service.RiskService;
import util.Utils;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
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

    private Risk newRisk = new Risk(Utils.NULL_ID(), "", "", "", "", "", "", "", "", "",Utils.EMPTY_VALUE(), Utils.NULL_ID());
    private String deleteRiskId;
    private List<String> importRisks = new ArrayList<String>();

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

    public String deleteRisk() {
        jsonResult = new HashMap<String, Object>();
        rs.deleteRisk(deleteRiskId);
        jsonResult.put("result", "success");
        return SUCCESS;
    }

    public String addRisk() {
        jsonResult = new HashMap<String, Object>();
        newRisk.setProjectId(Integer.parseInt(getCurrentProjectId()));
        newRisk.setUpdateTime(Utils.getCurrentTime());
        newRisk.setCreatorName(getCurrentUser());
        rs.addRisk(Utils.object2Array(newRisk));
        jsonResult.put("result", "success");
        return SUCCESS;
    }

    public String importRisk() {
        jsonResult = new HashMap<String, Object>();
        String[] risks = new String[importRisks.size()];
        for (int i = 0; i<risks.length; i++) {
            risks[i] = importRisks.get(i);
        }
        rs.importRisk(risks, getCurrentProjectId(), getCurrentUser());
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

    public String[] getParticipants() {
        return participants;
    }

    public void setParticipants(String[] participants) {
        this.participants = participants;
    }

    public Risk getNewRisk() {
        return newRisk;
    }

    public void setNewRisk(Risk newRisk) {
        this.newRisk = newRisk;
    }

    public String getDeleteRiskId() {
        return deleteRiskId;
    }

    public void setDeleteRiskId(String deleteRiskId) {
        this.deleteRiskId = deleteRiskId;
    }

    public List<String> getImportRisks() {
        return importRisks;
    }

    public void setImportRisks(List<String> importRisks) {
        this.importRisks = importRisks;
    }
}
