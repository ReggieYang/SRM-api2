package action;

import dao.DBConnection;
import scala.Tuple1;
import service.RiskService;
import util.Utils;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Wei on 2016/11/16.
 */
public class AnalysisAction extends BaseAction {

    private String riskFromDate;
    private String riskToDate;
    private String problemFromDate;
    private String problemToDate;

    private Map<String, Object> jsonResult;

    //get database connection
    Connection conn = DBConnection.getConnection();
    //instantiate a service with the connection
    RiskService rs = new RiskService(conn);

    public String toAnalysis() {
        return SUCCESS;
    }

    public String topRisk() {
        jsonResult = new HashMap<String, Object>();
        modifyDate("risk");
        jsonResult.put("result", "success");
        jsonResult.put("riskList", rs.getIdentifiedRisk(riskFromDate, riskToDate)._1());
        jsonResult.put("countList", rs.getIdentifiedRisk(riskFromDate, riskToDate)._2());
        return SUCCESS;
    }

    public String topProblem() {
        jsonResult = new HashMap<String, Object>();
        modifyDate("problem");
        jsonResult.put("result", "success");
        jsonResult.put("riskList", rs.getProblematicRisk(problemFromDate, problemToDate)._1());
        jsonResult.put("countList", rs.getProblematicRisk(problemFromDate, problemToDate)._2());
        return SUCCESS;
    }

    private void modifyDate(String type) {
        if (type.equals("risk")) {
            if (riskFromDate.equals("")) {
                riskFromDate = "2012-01-01";
            }
            if (riskToDate.equals("")) {
                riskToDate = Utils.getCurrentTime();
            }
        } else if (type.equals("problem")) {
            if (problemFromDate.equals("")) {
                problemFromDate = "2012-01-01";
            }
            if (problemToDate.equals("")) {
                problemToDate = Utils.getCurrentTime();
            }
        }

    }

    public String getRiskFromDate() {
        return riskFromDate;
    }

    public void setRiskFromDate(String riskFromDate) {
        this.riskFromDate = riskFromDate;
    }

    public String getRiskToDate() {
        return riskToDate;
    }

    public void setRiskToDate(String riskToDate) {
        this.riskToDate = riskToDate;
    }

    public String getProblemFromDate() {
        return problemFromDate;
    }

    public void setProblemFromDate(String problemFromDate) {
        this.problemFromDate = problemFromDate;
    }

    public String getProblemToDate() {
        return problemToDate;
    }

    public void setProblemToDate(String problemToDate) {
        this.problemToDate = problemToDate;
    }

    public Map<String, Object> getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(Map<String, Object> jsonResult) {
        this.jsonResult = jsonResult;
    }
}
