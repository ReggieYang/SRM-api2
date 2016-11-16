$(document).ready(function() {
    $('#addButton').click(function() {
        let isClicked = $(this).attr('isClicked');
        console.log(isClicked);
        if (isClicked == 'false') {
            $('#addPanel').show();
            $('#addButtonText').text('Cancel');
            $(this).attr('isClicked', 'true');
        } else {
            $('#addPanel').hide();
            $('#addButtonText').text('Add a risk');
            $(this).attr('isClicked', 'false');
        }
    });

    $('#importButton').click(function() {
        let isClicked = $(this).attr('isClicked');
        console.log(isClicked);
        if (isClicked == 'false') {
            $('#importPanel').show();
            $('#importButtonText').text('Cancel');
            $(this).attr('isClicked', 'true');
        } else {
            $('#importPanel').hide();
            $('#importButtonText').text('import risks');
            $(this).attr('isClicked', 'false');
        }
    });

    $('#riskForm').submit(function() {
        console.log('submit');
        $.post('./JSON/addRisk',
        {
            'newRisk.description': $('#riskForm [name="description"]').val(),
            'newRisk.status': $('#riskForm [name="status"]').val(),
            'newRisk.riskType': $('#riskForm [name="type"]').val(),
            'newRisk.possibility': $('#riskForm [name="possibility"]').val(),
            'newRisk.impact': $('#riskForm [name="impact"]').val(),
            'newRisk.threshold': $('#riskForm [name="threshold"]').val(),
            'newRisk.followerName': $('#riskForm [name="followerName"]').val()
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='./risk';
            } else {
                alert(data.message);
            }
        });
        return false;
    });

    $('#searchForm').submit(function() {
        let fromDate = $('#searchForm [name="fromDate"]').val();
        let toDate = $('#searchForm [name="toDate"]').val();
        let status = $('#searchForm [name="status"]').val();
        if (status == 'Risk') {
            $.post('./JSON/topRisk',
            {
                'riskFromDate': fromDate,
                'riskToDate': toDate
            }, function(data) {
                renderImportTable(data);
            });
        } else if (status == 'Problem') {
            $.post('./JSON/topProblem',
            {
                'problemFromDate': fromDate,
                'problemToDate': toDate
            }, function(data) {
                renderImportTable(data);
            });
        }
        return false;
    });

    $('#importRiskButton').click(function() {
        console.log('import');
        let data = {};
        let selectedRisk = getSelectedRisk();
        selectedRisk.forEach(function(val, idx) {
            data['importRisks['+idx+']'] = val;
        });
        $.post('./JSON/importRisk',
        data, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='./risk';
            } else {
                alert(data.message);
            }
        });
        return false;
    });

    function renderImportTable(data) {
        console.log(data);
        if (data.result == 'success') {
            $('#importTable tbody').empty();
            data.riskList.forEach(function(risk, idx) {
                let tr = '<tr><th><label><input type="checkbox" name="importRisk" value="'+risk.riskId+'"></label></th><td>'+risk.description+'</td><td>'+risk.riskType+'</td><td>'+risk.possibility+'</td><td>'+risk.impact+'</td><td>'+risk.threshold+'</td><td>'+risk.creatorName+'</td><td>'+risk.followerName+'</td>';
                $('#importTable tbody').append(tr);
            });
        } else {
            alert(data.message);
        }
    }

    $('.followupLink').click(function() {
        let riskId = $(this).attr('risk-id');
        $.post('./JSON/allFollowup',
        {
            riskId: riskId
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='./followup';
            } else {
                alert(data.message);
            }
        });
    });

    $('.deleteRisk').click(function() {
        let riskId = $(this).attr('risk-id');
        $.post('./JSON/deleteRisk',
        {
            'deleteRiskId': riskId
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='./risk';
            } else {
                alert(data.message);
            }
        });
    });

    function getSelectedRisk() {
        var result = [];
        $('[name="importRisk"]:checked').each(function(idx) {
            result.push($(this).val());
        });
        return result;
    }
})