$(document).ready(function() {

    var riskChart = echarts.init(document.getElementById('topRisks'));
    var problemChart = echarts.init(document.getElementById('topProblems'));

    $('#topRiskForm').submit(function() {
        let fromDate = $('#topRiskForm [name="fromDate"]').val();
        let toDate = $('#topRiskForm [name="toDate"]').val();
        $.post('./JSON/topRisk',
        {
            'riskFromDate': fromDate,
            'riskToDate': toDate
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                let xData = [];
                data.riskList.forEach(function(val, idx) {
                    xData.push(val.riskId);
                });
                drawTopRisks(xData, data.description);
            } else {
                alert(data.message);
            }
        });
        return false;
    });

    $('#topProblemForm').submit(function() {
        let fromDate = $('#topProblemForm [name="fromDate"]').val();
        let toDate = $('#topProblemForm [name="toDate"]').val();
        $.post('./JSON/topProblem',
        {
            'problemFromDate': fromDate,
            'problemToDate': toDate
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                let xData = [];
                data.riskList.forEach(function(val, idx) {
                    xData.push(val.description);
                });
                drawTopProblems(xData, data.countList);
            } else {
                alert(data.message);
            }
        });
        return false;
    });

    function drawTopRisks(xData, yData) {
        let option = getOption(xData, yData);
        option['color'] = ['#2f4554'];
        riskChart.setOption(option);
    }

    function drawTopProblems(xData, yData) {
        let option = getOption(xData, yData);
        problemChart.setOption(option);
    }

    function getOption(xData, yData) {
        let option = {
            title: {
                show: false
            },
            tooltip: {},
            legend: {
                data:['problems'],
                top: 'bottom'
            },
            xAxis: {
                data: xData
            },
            yAxis: {},
            series: [{
                name: 'problems',
                type: 'bar',
                data: yData
            }]
        };
        return option;
    }

});