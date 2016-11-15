package test;


import dao.DBConnection;
import model.Risk;
import scala.Tuple2;
import service.RiskService;
import util.Utils;

import java.sql.Connection;

/**
 * Created by ReggieYang on 2016/11/7.
 */
public class DemoJava {

    public static void main(String args[]) {

        Connection conn = DBConnection.getConnection();
        RiskService riskService = new RiskService(conn);
        for (Tuple2<Risk, String> riskObjectTuple2 : riskService.getIdentifiedRisk(Utils.SYSTEM_INITIAL_TIME(), Utils.getCurrentTime())) {
            System.out.println(riskObjectTuple2._1());
            System.out.println(riskObjectTuple2._2());
        }


    }

}
