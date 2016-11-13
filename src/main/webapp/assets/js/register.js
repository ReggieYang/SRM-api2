$(document).ready(function() {
    $('#registerForm').submit(function() {
        console.log('submit');
        $.post('./JSON/register',
        {
            newUser_userName: $('#name').val(),
            newUser_password: $('#password').val(),
            newUser_company: $('#corp').val(),
            newUser_position: $('#role').val()
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