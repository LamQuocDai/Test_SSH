// Control + shift + R to remove cache on browser.

function open_login() {
    const formlogin = document.getElementById('user');
    const formmain = document.getElementById('main');
    if (formlogin.style.display === "none") {
        formlogin.style.display = "block";
        formmain.style.opacity = "0.5";
    }
    else {
        formlogin.style.display = "none";
        formmain.style.opacity = "1";
    }
}

function change_icon() {
    const icon_hide_pass = document.getElementById('hide_pass');
    const icon_show_pass = document.getElementById('show_pass');
    const input_password_login = document.getElementById('passwordLogin');
    if (icon_hide_pass.style.display === "none") {
        input_password_login.setAttribute('type', 'password');
        icon_hide_pass.style.display = "block";
        icon_show_pass.style.display = "none";
    } else {
        input_password_login.setAttribute('type', 'text');
        icon_hide_pass.style.display = "none";
        icon_show_pass.style.display = "block";
    }
}

function open_signup() {
    const fsignup = document.getElementById('signup');
    const flogin = document.getElementById('login');

    if (fsignup.style.display === "block") {
        fsignup.style.display = "none";
        flogin.style.display = "block";
    }
    else {
        fsignup.style.display = "block";
        flogin.style.display = "none";
    }
}