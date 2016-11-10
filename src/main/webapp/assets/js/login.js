$(document).ready(function() {
    $('#loginForm').submit(function() {
        console.log('submit');
        $.post('./JSON/log',
        {
            userName: $('#name').val(),
            password: $('#password').val()
        }, function(data, status) {
            console.log(data);
        });
        return false;
    });
})