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

    $('#riskForm').submit(function() {
        console.log('submit');
        $.post('./JSON/addRisk',
        {
            'newRisk_description': $('#description').val(),
            'newRisk_riskType': $('#type').val(),
            'newRisk_possibility': $('#possibility').val(),
            'newRisk_impact': $('#impact').val(),
            'newRisk_threshold': $('#threshold').val(),
            'newRisk_followerName': $('#followerName').val()
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
})