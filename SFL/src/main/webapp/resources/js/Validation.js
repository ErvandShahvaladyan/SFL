$(document).ready(function () {

    $('#firstname').blur(function () {
        $.ajax({
            type: 'POST',
            url: 'checkFirstname',
            data: {
                firstname: $('#firstname').val()
            },
            success: function (response) {
                if (response.status != 'SUCCESS') {
                    $('#ajaxFirstnameResponse').html("Please input your firstname");
                } else {
                    $('#ajaxFirstnameResponse').html("");
                }
            }
        });
    });

    $('#lastname').blur(function () {
        $.ajax({
            type: 'POST',
            url: 'checkLastname',
            data: {
                lastname: $('#lastname').val()
            },
            success: function (response) {
                if (response.status != 'SUCCESS') {
                    $('#ajaxLastnameResponse').html("Please input your lastname");
                } else {
                    $('#ajaxLastnameResponse').html("");
                }
            }
        });
    });

    $('#email').blur(function () {
        $.ajax({
            type: 'POST',
            url: 'checkEmail',
            data: {
                email: $('#email').val()
            },
            success: function (response) {
                if (response.status != 'SUCCESS') {
                    $('#ajaxEmailResponse').html("Please input correct email");
                } else {
                    $('#ajaxEmailResponse').html("");
                }
            }
        });
    });

    $('#password').blur(function () {
        $.ajax({
            type: 'POST',
            url: 'checkPassword',
            data: {
                password: $('#password').val()
            },
            success: function (response) {
                if (response.status != 'SUCCESS') {
                    $('#ajaxPasswordResponse').html("Please input your password");
                } else {
                    $('#ajaxPasswordResponse').html("");
                }
            }
        });
    });
});