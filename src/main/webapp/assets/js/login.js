$(document).ready(function() {
    $('#loginForm').submit(function() {
        console.log('submit');
        $.post('./JSON/log',
        {
            userName: $('#name').val(),
            password: $('#password').val()
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
})