<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WelCome.aspx.cs" Inherits="_Management_WelCome" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>引导页</title>
	    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
        <link href="css/style.css" rel="stylesheet" />
		<style type="text/css">
			.right_img{
				width: 100%;
				height: 3.15rem;
				display: inline-block;
				border-radius: 0.02rem;
				margin-bottom: 0.2rem;
				background: url(img/enter_bg.jpg) no-repeat center;
				background-size: cover;
			}
			.right_img>h3{
				color: #fff;
				text-align: center;
				font-size: 0.24rem;
				margin-top: 1.2rem;
			}
			.right_img>h3>span{
				display: block;
				margin-top: 0.2rem;
			}
			.nav{
				width: 100%;
				height: 1.55rem;
				background-color: #f5f5f5;
				padding: 0.22rem 0;
				text-align: center;
			}
			.nav a{
				width: 19.6%;
				height: 1.1rem;
				border-right: 1px solid #e5e5e5;
				display: inline-block;
			}
			.nav a:last-child{
				border-right: 0;
			}
			.nav>a>div{
				width: 0.62rem;
				height: 0.62rem;
				border-radius: 50%;
				overflow: hidden;
				margin: 0.1rem auto;
			}
			.nav>a>div>img{
				width: 100%;
				height: 100%;
				display: block;
			}
		</style>
	</head>
	<body>
		<div class="iframe_right">
			<div class="right_img">
				<h3>欢迎登录<span>青海大学科技企业园服务平台后台</span></h3>
			</div>
			<div class="nav">
				<a href="javascript:void(0)" data-tag="Ent">
					<div>
						<img src="img/nav1.png"/>
					</div>
					<span>企业库</span>
				</a>
				<a href="javascript:void(0)" data-tag="Finance">
					<div>
						<img src="img/nav1.png"/>
					</div>
					<span>融资管理</span>
				</a>
				<a href="javascript:void(0)" data-tag="Info">
					<div>
						<img src="img/nav2.png"/>
					</div>
					<span>信息库</span>
				</a>
				<a href="javascript:void(0)" data-tag="Hr">
					<div>
						<img src="img/nav3.png"/>
					</div>
					<span>招聘管理</span>
				</a>
				<a href="javascript:void(0)" data-tag="Meeting">
					<div>
						<img src="img/nav4.png"/>
					</div>
					<span>会议室预约管理</span>
				</a>
			</div>
		</div>
        <script src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $(".nav>a").click(function () {
                    self.$ = parent.$;
                    //console.log($(window.parent.document).find("[data-tag='" + $(this).attr("data-tag") + "']").html());
                    parent.$("[data-tag='" + $(this).attr("data-tag") + "']", parent.doucment).trigger('click');
                });
            });
        </script>
	</body>
</html>
