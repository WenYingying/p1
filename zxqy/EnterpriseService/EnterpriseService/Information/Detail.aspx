<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Information_Detail" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>信息服务详情</title>
		<meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no", name="viewport">
		<link rel="stylesheet" type="text/css" href="../css/style.css"/>
		<style type="text/css">
			.content{
				height: 83.5%;
				top: 1.1rem;
			}
			.content_center{
				margin-top: 0 !important;
			}
			.content_center>.right{
				width: 7.7rem;
				display: inline-block;
				margin-left: 0;
				background-color: #f5f5f5;
			}
			.content_center>.right li{
				width: 7.2rem;
    			margin: 0 auto;
    			margin-bottom: 0.2rem;
			}
			.content_center li.tit{
			    font-size: 0.16rem;
			    font-weight: bold;
			    margin-top: 0.1rem;
			}
			.content_center>.right li.time{
			    font-size: 0.12rem;
			    border-bottom: 1px solid #dbdbdb;
			    padding-bottom: 0.2rem;
			}
			.content_center li.time>span{
				width: 1rem;
    			display: inline-block;
			}
			.pics>img{
				max-width: 7rem;
				max-height: 4rem;
			}
			.left_box{
				width: 4rem;
				display: inline-block;
				margin-left: 0.2rem;
				vertical-align: top;
			}
			.left_box .left{
				width: 4rem;
				position: initial;
				background-color: #f5f5f5;
				margin-bottom: 0.2rem;
			}
			.left_box .left li{
				width: 3.6rem;
				margin: 0 auto;
				margin-bottom: 0.2rem;
			}
			.left .pics>img{
				width: 3.6rem;
				height: 2.7rem;
				display: block;
				margin-top: 0.2rem;
				overflow: hidden;
			}
		</style>
	</head>
	<body>
		<header>
			<div class="head">
				<ul>
					<li class="tit">青海大学国家大学科技园企业服务平台</li>
					<li class="nav">
						<a href="../Default.aspx">首页</a>
						<a href="../Enterprise/Default.aspx">企业</a>
						<a href="../Finance/Default.aspx">融资</a>
						<a href="../Hr/Default.aspx">招聘</a>
						<a href="Default.aspx" class="active">信息服务</a>
					</li>
					<li>
                    <%if (object.Equals(null, Request.Cookies["User"]))
                        { %>
                    <a href="../request.html" class="apply">申请入驻</a>
                    <a href="../login.html" class="login">登录</a>
                    <%}
                    else
                    { %>
                    <a href="javascript:void(0)" class="end"><%=Server.UrlDecode(Request.Cookies["User"]["Name"]) %>/退出</a>
                    <div class="hide">
                        <a href="../EnterpriseManage/Default.aspx">管理</a>
                        <a href="../Enterprise/EntHome.aspx?ID=<%=Request.Cookies["User"]["EnterpriseID"] %>">我的企业</a>
                        <a href="../login.html">退出</a>
                    </div>
                    <%} %>
					</li>
				</ul>
			</div>
		</header>
		<div class="breadcrumbs">
			<div>
				<a href="../Default.aspx">首页</a>
				<span class="sep">/</span>
				<a href="Default.aspx?Type=<%=info.Type %>">信息服务</a>
				<span class="sep">/</span>
				<a>信息服务详情</a>
			</div>
		</div>
		<div class="content">
			<div class="content_center">
				<div class="right">
					<ul>
						<li class="tit">
							<%=info.Title %>
						</li>
						<li class="time">
							<span class="iconfont"><%=Convert.ToDateTime(info.PostTime).ToString("yyyy/MM/dd") %></span>
							<span class="iconfont"><%=info.Type %></span>
						</li>
                        <%if (info.CoverPic.Trim().Length > 0){ %>
						<li class="pics" style="text-align:center;">
							<img src="<%=!string.IsNullOrEmpty(info.CoverPic) ? string.Format("{0}InformationPic/{1}/{2}/{3}/{4}", ConfigurationManager.AppSettings["FileUrl"], info.CoverPic.Substring(0, 4), info.CoverPic.Substring(4, 2), info.CoverPic.Substring(6, 2), info.CoverPic) : string.Format("{0}InformationPic/{1}", ConfigurationManager.AppSettings["FileUrl"], "NoPic.png") %>" />
						</li>
                        <%} %>
						<li class="character">
							<%=info.Content %>
						</li>
					</ul>
				</div>
				<div class="left_box">
                    <asp:Repeater ID="rpList" runat="server">
                        <ItemTemplate>
                        <a href="Detail.aspx?ID=<%#Eval("ID") %>">
					<div class="left">
						<ul>
							<li class="pics">
								<img src="<%#!object.Equals(null,Eval("CoverPic"))&&!string.IsNullOrEmpty(Eval("CoverPic").ToString().Trim())?string.Format("{0}InformationPic/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("CoverPic").ToString().Trim().Substring(0,4),Eval("CoverPic").ToString().Trim().Substring(4,2),Eval("CoverPic").ToString().Trim().Substring(6,2),Eval("CoverPic").ToString().Trim()):string.Format("{0}InformationPic/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoPic.png") %>"/>
							</li>
							<li class="tit">
								<%#Eval("Title") %>
							</li>
							<li class="time">
								<span class="iconfont"><%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy/MM/dd") %></span>
								<span class="iconfont"><%#Eval("Type") %></span>
							</li>
						</ul>
					</div>
                            </a>

                        </ItemTemplate>
                    </asp:Repeater>
				</div>
			</div>
			<footer>
				copyright @ 2016青海大学企业服务平台 | ICP备15031425号-3
			</footer>
		</div>
        <script src="../js/jquery-3.1.0.min.js"></script>
        <script src="../js/Common.js"></script>
    </body>
</html>
