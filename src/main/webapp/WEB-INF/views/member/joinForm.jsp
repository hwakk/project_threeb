<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!-- All the files that are required -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Varela+Round&family=Nanum+Gothic&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/member/joinForm.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="UTF-8">
<title>sign up</title>
<style>
html, body {
	font-family: 'Varela Round', 'Nanum Gothic';
}
input:focus {
	outline: none;
}
textarea:focus {
	outline: none;
}
button:focus {
	outline: none;
}
.navbar {
	border: none;
}
</style>
<script>
window.onload = function () {
	$("#member_id").val("");
	$("#member_pwd").val("");
	$("#member_pwd_confirm").val("");
	$("#member_name").val("");
	$("#phone").val("");
	$("#email").val("");
	$("#agree").val("");
}
</script>
</head>
<body>
<!-- REGISTRATION FORM -->
<div class="text-center" style="padding:50px 0">
	<div class="logo">sign up</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form action="${contextPath }/member/addMember.do" method="post" id="register-form" class="text-left">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="member_id" class="sr-only">ID</label>
						<input type="text" class="form-control" id="member_id" name="member_id" placeholder="아이디">
					</div>
					<div class="form-group">
						<label for="member_pwd" class="sr-only">Password</label>
						<input type="password" class="form-control" id="member_pwd" name="member_pwd" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<label for="member_pwd_confirm" class="sr-only">Password Confirm</label>
						<input type="password" class="form-control" id="member_pwd_confirm" name="member_pwd_confirm" placeholder="비밀번호 확인">
					</div>
					<div class="form-group">
						<label for="member_name" class="sr-only">Name</label>
						<input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름">
					</div>
					<div class="form-group">
						<label for="phone" class="sr-only">Phone</label>
						<input type="text" class="form-control" id="phone" name="phone" placeholder="연락처">
					</div>
					<div class="form-group">
						<label for="email" class="sr-only">Email</label>
						<input type="text" class="form-control" id="email" name="email" placeholder="이메일">
					</div>
					<div class="form-group login-group-checkbox">
						<input type="checkbox" class="" id="agree" name="agree"><label for="agree">개인정보 수집 및 이용에 대한 동의</label>
					</div>
				</div>
				<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>이미 ThreeB 계정이 있나요?&nbsp;&nbsp;<a href="${contextPath }/member/loginForm.do">로그인</a></p>
			</div>
		</form>
		<script>
		(function($) {
			"use strict";

			// Options for Message
			// ----------------------------------------------
			var options = {
				'btn-primary' : '<i class="fa fa-chevron-right"></i>',
				'btn-loading' : '<i class="fa fa-spinner fa-pulse"></i>',
				'btn-success' : '<i class="fa fa-check"></i>',
				'btn-error' : '<i class="fa fa-remove"></i>',
				'msg-success' : '회원가입 되었습니다.',
				'msg-error' : '가입할 수 없습니다. 다시 시도해주세요.',
				'msg-error-id' : '이미 사용중인 아이디 입니다.',
				'msg-error-agree' : '약관에 동의해주세요.',
				'useAJAX' : true,
			};
			
			//연락처 유효성 검사
			jQuery.validator.addMethod(
				"phone",
				function(phone_number, element) {
					phone_number = phone_number.replace(/\s+/g, "");
					return this.optional(element) || phone_number.length > 9 && 
						phone_number.match(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
				}, "Please specify a valid phone number");

			// Register Form
			// ----------------------------------------------
			// Validation
			$("#register-form").validate({
				rules : {
					member_id : {
						required : true,
						rangelength : [ 4, 20 ]
					},
					member_pwd : {
						required : true,
						rangelength : [ 8, 20 ]
					},
					member_pwd_confirm : {
						equalTo : "#register-form [name=member_pwd]"
					},
					member_name : {
						required : true,
						rangelength : [ 2, 20 ]
					},
					phone : {
						required : true,
						minlength: 9,
						phone : true
					},
					email : {
						required : true,
						email : true
					}
				},
				messages : {
					member_id : {
						required : "아이디를 입력해주세요.",
						rangelength : "4~20자만 사용가능합니다."
					},
					member_pwd : {
						required : "비밀번호를 입력해주세요.",
						rangelength : "8~20자만 사용가능합니다."
					},
					member_pwd_confirm : {
						equalTo : "입력하신 비밀번호와 일치하지 않습니다."
					},
					member_name : {
						required : "이름을 입력해주세요.",
						rangelength : "2~10자만 사용가능합니다."
					},
					phone : {
						required : "연락처를 입력해주세요.",
						minlength: "9자 이상 입력해주세요.",
						phone : "잘못된 연락처 입니다."
					},
					email : {
						required : "이메일을 입력해주세요.",
						email : "잘못된 이메일 입니다."
					}
				},
				errorClass : "form-invalid"
			});
			
			// Form Submission
			$("#register-form").submit(function() {
				form_primary($(this));
				if (options['useAJAX'] == true) {
					// Dummy AJAX request (Replace this with your AJAX code)
					// If you don't want to use AJAX, remove this
					dummy_submit_form($(this));
					// Cancel the normal submission.
					// If you don't want to use AJAX, remove this
					return false;
				}
			});

			// Loading
			// ----------------------------------------------
			function remove_loading($form) {
				$form.find('[type=submit]').removeClass('error success');
				$form.find('.login-form-main-message')
						.removeClass('show error success').html('');
			}

			function form_primary($form) {
				$form.find('[type=submit]').removeClass('error success clicked').html(
						options['btn-primary']);
				$form.find('.login-form-main-message')
						.removeClass('show error success').html('');
			}

			function form_loading($form) {
				$form.find('[type=submit]').addClass('clicked').html(
						options['btn-loading']);
			}

			function form_success($form) {
				$form.find('[type=submit]').addClass('success').html(
						options['btn-success']);
				$form.find('.login-form-main-message').addClass('show success').html(
						options['msg-success']);
			}

			function form_failed($form) {
				$form.find('[type=submit]').addClass('error')
						.html(options['btn-error']);
				$form.find('.login-form-main-message').addClass('show error').html(
						options['msg-error']);
			}
			
			function form_failed_id($form) {
				$form.find('[type=submit]').addClass('error')
						.html(options['btn-error']);
				$form.find('.login-form-main-message').addClass('show error').html(
						options['msg-error-id']);
			}
			
			function form_failed_agree($form) {
				$form.find('[type=submit]').addClass('error')
						.html(options['btn-error']);
				$form.find('.login-form-main-message').addClass('show error').html(
						options['msg-error-agree']);
			}

			// Dummy Submit Form (Remove this)
			// ----------------------------------------------
			// This is just a dummy form submission. You should use your AJAX
			// function or remove this function if you are not using AJAX.
			function dummy_submit_form($form) {
				if ($form.valid()) {
					if(!$("#agree").is(':checked')) {
						form_loading($form);
						setTimeout(function() {
							form_failed_agree($form);
						}, 500)
						return;
					}
					$.ajax({
						type : "post",
						async : false,
						url : "${contextPath}/member/addMember.do",
						dataType : "text",
						data : {
							member_id : $("#member_id").val(),
							member_pwd : $("#member_pwd").val(),
							member_name : $("#member_name").val(),
							tel : $("#phone").val(),
							email : $("#email").val()
						},
						success : function(data, textStatus) {
							if (data == 'true') {
								form_loading($form);
								alert("회원가입 되었습니다.");
								location.href = "${contextPath}/member/loginForm.do";
							}else if(data == 'id_false') {
								form_loading($form);
								setTimeout(function() {
									form_failed_id($form);
								}, 1000);
							}else {
								form_loading($form);
								setTimeout(function() {
									form_failed($form);
								}, 1000);
							}
						},
						error : function(data, textStatus) {
							alert("오류가 발생했습니다.");
						},
						complete : function(data, textStatus) {

						}
					});
				}
			}
		})(jQuery);
		</script>
	</div>
	<!-- end:Main Form -->
</div>
</body>
</html>