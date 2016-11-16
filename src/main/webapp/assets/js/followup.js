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
            $('#addButtonText').text('Add a followup');
            $(this).attr('isClicked', 'false');
        }
    });

    $('#followupForm').submit(function() {
        console.log('submit');
        $.post('./JSON/addFollowup',
        {
            'newFollowup.description': $('#followupForm [name="description"]').val(),
            'newFollowup.status': $('#followupForm [name="status"]').val(),
            'newFollowup.riskType': $('#followupForm [name="type"]').val(),
            'newFollowup.possibility': $('#followupForm [name="possibility"]').val(),
            'newFollowup.impact': $('#followupForm [name="impact"]').val(),
            'newFollowup.threshold': $('#followupForm [name="threshold"]').val(),
            'newFollowup.followerName': $('#followupForm [name="followerName"]').val()
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='./followup';
            } else {
                alert(data.message);
            }
        });
        return false;
    });

    $('.deleteFollowup').click(function() {
        let followupId = $(this).attr('followup-id');
        $.post('./JSON/deleteFollowup',
        {
            'followup.followupId': followupId
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