<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!------ Include the above in your HEAD tag ---------->

<!-- All the files that are required -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Varela+Round&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Gothic+A1&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/member/loginForm.css">
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
}
</script>
<title>login</title>
</head>
<body>
	<!-- Where all the magic happens -->
	<!-- LOGIN FORM -->
	<div class="text-center" style="padding: 50px 0">
		<div class="logo">login</div>
		<!-- Main Form -->
		<div class="login-form-1">
			<form id="login-form" class="text-left">
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
					</div>
					<button type="submit" class="login-button">
						<i class="fa fa-chevron-right"></i>
					</button>
				</div>
				<div class="etc-login-form">
					<!-- <p>비밀번호를 잊으셨나요?&nbsp;&nbsp;<a href="#">찾기</a></p> -->
					<p>계정이 없으세요?&nbsp;&nbsp;<a href="${contextPath }/member/joinForm.do">회원가입</a></p>
				</div>
			</form>
			<script>
			(function($) {
				"use strict";
	
				// Options for Message
				//----------------------------------------------
				var options = {
					'btn-primary' : '<i class="fa fa-chevron-right"></i>',
					'btn-loading' : '<i class="fa fa-spinner fa-pulse"></i>',
					'btn-success' : '<i class="fa fa-check"></i>',
					'btn-error' : '<i class="fa fa-remove"></i>',
					'msg-success' : '로그인 되었습니다.',
					'msg-error' : '아이디와 비밀번호가 일치하지 않습니다.',
					'useAJAX' : true,
				};
	
				// Login Form
				//----------------------------------------------
				// Validation
				$("#login-form").validate({
					rules : {
						member_id : "required",
						member_pwd : "required",
					},
					messages : {
						member_id : {
							required : "아이디를 입력해주세요."
						},
						member_pwd : {
							required : "비밀번호를 입력해주세요."
						}
					},
					errorClass : "form-invalid"
				});
	
				// Form Submission
				$("#login-form").submit(function() {
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
				//----------------------------------------------
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
	
				// Dummy Submit Form (Remove this)
				//----------------------------------------------
				// This is just a dummy form submission. You should use your AJAX function or remove this function if you are not using AJAX.
				var refUrl="<%=session.getAttribute("refUrl")%>";
				function dummy_submit_form($form) {
					if ($form.valid()) {
						$.ajax({
							type : "post",
							async : false,
							url : "${contextPath}/member/login.do",
							dataType : "text",
							data : {
								member_id : $("#member_id").val(),
								member_pwd : $("#member_pwd").val()
							},
							success : function(data, textStatus) {
								if (data == 'true') {
									form_loading($form);
									if(refUrl=='/threeb/member/joinForm.do') {
										location.href='${contextPath}/main.do';
									}else {
										location.href=refUrl;
									}
								} else {
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