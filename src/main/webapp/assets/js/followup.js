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
            'newFollowup_status': $('#status').val()
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='/followup';
            } else {
                alert(data.message);
            }
        });
        return false;
    });
})