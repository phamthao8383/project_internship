


// phân trang
function activePage(id) {
    document.getElementById("page"+id).className = "active";

}

//Show input ảnh
function chooseFile(fileInput) {
    if(fileInput.files && fileInput.files[0] ) {
        var reader = new FileReader();

        reader.onload = function (e) {
            document.getElementById('imageInput').setAttribute('src', e.target.result);
        }
        reader.readAsDataURL(fileInput.files[0]);
    }
}


// Validate ChangePassword
function validateChangePass() {
    let currentPassword = document.getElementById("currentPassword").value;
    let errorCurrentPassword = document.getElementById('errorCurrentPassword1');
    if(currentPassword == '' || currentPassword == null){
        errorCurrentPassword.innerHTML = 'Vui lòng nhập mật khẩu hiện tại';
        return false;
    } else {
        errorCurrentPassword.innerHTML = '';
    }

    const inputNewPassword = document.getElementById('inputNewPassword').value;
    const errPass = document.getElementById('errPass');
    if ( inputNewPassword == '' || inputNewPassword== null) {
        errPass.innerHTML = "Mật khẩu vui lòng không để trống!";
        return false;
    } else {
        errPass.innerHTML = "";
    }

    const inputConfirmPassword = document.getElementById('inputConfirmPassword').value;
    const errConPass = document.getElementById('errConPass');

    if (inputConfirmPassword == '' || inputConfirmPassword == null) {
        errConPass.innerHTML = "Xác nhận mật khẩu vui lòng không để trống!";
        return false;
    } else if (inputConfirmPassword != inputNewPassword) {
        errConPass.innerHTML = 'Xác nhận mật khẩu không trùng khớp.';
        return false;
    } else {
        errConPass.innerHTML = "";
    }

    return true;
}

function changePassword() {
    if(validateChangePass()){
        document.getElementById("form-editpass").submit();
        localStorage.setItem('isPasswordChange', true);
    }
}

$(document).ready(function () {
    if(localStorage.getItem('isPasswordChange')=="true" && $("#errorCurrentPassword").length <= 0){
        Swal.fire({
            position: 'center-center',
            icon: 'success',
            title: 'Đổi mật khẩu thành công!',
            showConfirmButton: false,
            timer: 1500
        });
        localStorage.removeItem('isPasswordChange');
    } else if ($("#errorCurrentPassword").length > 0) {
        Swal.fire({
            position: 'center-center',
            icon: 'error',
            title: 'Đổi mật khẩu không thành công!',
            showConfirmButton: false,
            timer: 1500
        });
        $("#changePasswordBtn").trigger('click');
        localStorage.removeItem('isPasswordChange');
    }
    localStorage.removeItem('isPasswordChange');
})

// <%--Validate Edit--%>
function ValidateEdit(){
    var name = document.getElementById('inputName').value;
    var errName = document.getElementById('errorName');
    var regexName = /^[^\d+]*[\d+]{0}[^\d+]*$/;



    var email = document.getElementById('inputEmail').value;
    var errEmail = document.getElementById('erorEmail');
    var reGexEmail = /^([a-z]{2}).+.[a-zA-Z0-9_.]{1,20}.+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;

    var phone = document.getElementById('inputPhone').value;
    var erorPhone = document.getElementById('erorPhone');
    var regexPhone = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;


    if(name==''||name==null){
        errName.innerHTML="̣Tên đăng nhập không được để trống";
    }
    else if(!regexName.test(name)){
        errName.innerHTML="Tên đăng nhập không hợp lệ";
        return false;
    }else{
        errName.innerHTML="";
    }

    if(email==''||email==null){
        errEmail.innerHTML="Email không được để trống";
    }else if(!reGexEmail.test(email)){
        errEmail.innerHTML="Email không hợp lệ";
        return  false;
    }else {
        errEmail.innerHTML='';
    }
    if (phone == '' || phone == null) {
        erorPhone.innerHTML = "Số điện thoại không được để trống!";
    } else if (!regexPhone.test(phone)) {
        erorPhone.innerHTML = "SĐT không hợp lệ!";
        return false;
    } else {
        erorPhone.innerHTML = '';
    }
    if (name && phone && email ) {
        document.getElementById("form-chinhsua").submit();
    } else {

    }
    return false;
}
