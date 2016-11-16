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
            $('#addButtonText').text('Add a project');
            $(this).attr('isClicked', 'false');
        }
    });

    $('#projectForm').submit(function() {
        console.log('submit');
        $.post('./JSON/addProject',
        {
            'newProject_projectName': $('#projectForm [name="projectName"]').val()
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='./project';
            } else {
                alert(data.message);
            }
        });
        return false;
    });

    $('.riskLink').click(function() {
        let projectId = $(this).attr('project-id');
        $.post('./JSON/allRisk',
        {
            projectId: projectId
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='./risk';
            } else {
                alert(data.message);
            }
        });
    });

    $('.deleteProject').click(function() {
        let projectId = $(this).attr('project-id');
        $.post('./JSON/deleteProject',
        {
            'project.projectId': projectId
        }, function(data) {
            console.log(data);
            if (data.result == 'success') {
                window.location.href='./project';
            } else {
                alert(data.message);
            }
        });
    });

})