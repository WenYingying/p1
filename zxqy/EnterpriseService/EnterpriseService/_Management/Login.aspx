<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Management_Login" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
	    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no", name="viewport">
	    <link rel="stylesheet" type="text/css" href="css/style.css"/>
	    <style type="text/css">
	    	body {
			    background: url(img/login_bg.jpg) top left;
			    background-size: cover;
			    overflow: hidden;
			}
			.content{
				width: 100%;
				height: 100%;
			}
			.content>h1{
				width: 100%;
				color: #fff;
				font-size: 0.36rem;
				font-weight: bold;
				text-align: center;
				padding-top: 0.7rem;
				margin-bottom: 0.5rem;
			}
			.login{
				width: 3.4rem;
				margin: 0 auto;
				background-color: #fff;
				border-radius: 0.03rem;
				box-shadow: 1px 1px 6px 2px #ccc;
			}
			.login .tit{
				color: #333333;
				font-size: 0.2rem;
				font-weight: bold;
				line-height: 0.45rem;
				margin-top: 0.22rem;
				margin-bottom: 0.22rem;
				border-bottom: 1px solid #aaaaaa;
			}
			.login li{
				width: 3rem;
				margin: 0 0.2rem;
				margin-bottom: 0.18rem;
			}
			.login li>input{
				width: 2.96rem;
				height: 0.45rem;
				color: #959595;
				font-size: 0.16rem;
				border: 1px solid #aaaaaa;
				text-indent: 0.1rem;
			}
			.btn{
				width: 3rem;
				height: 0.45rem;
				line-height: 0.45rem;
				color: #fff;
				font-size: 0.18rem;
				text-align: center;
				background-color: #a40000;
				margin: 0.05rem 0;
				display: block;
                padding:0;
			}
	    </style>
	</head>
	<body>
		<div class="content">
			<h1>青海大学企业服务平台运营后台 </h1>
			<div class="login">
				<ul>
					<li class="tit">登录</li>
					<li>
						<input type="text" name="" id="LoginName" value="" placeholder="请输入账号/手机号码"/>
					</li>
					<li>
						<input type="password" name="" id="Password" value="" placeholder="请输入密码" />
					</li>
					<li>
						<a href="javascript:void(0)" class="btn" id="submitBtn">登录</a>
					</li>
				</ul>
			</div>
		</div>
        <script src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript">
            $(function () {
                var postFunc = function (e) {
                    var LoginName = $.trim($("#LoginName").val()), Password = $.trim($("#Password").val());
                    if (LoginName.length == 0 || Password.length == 0)
                    {
                        alert("请输入登录账号和密码");
                        return;
                    }
                    $(e.target).off().text("处理中....");
                    $.post("../Handler/AdminLoginHandler.ashx", { LoginName: LoginName, Password: Password }, function (res) {
                        var json = JSON.parse(res);
                        if (json.Result)
                        {
                            parent.location.href = "Default.aspx"
                            return;
                        }
                        alert(json.Message);
                        $(e.target).on("click",postFunc).text("登录");
                    });
                };
                $("#submitBtn").on("click", postFunc);
            });
        </script>
	</body>
</html>
