<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Hr_Detail" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>招聘详情</title>
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
			}
			.content_center>.right>ul>li{
				width: 7.28rem;
			    font-size: 0.16rem;
			    line-height: 0.35rem;
			    border-radius: 0.02rem;
			    display: inline-block;
			    border: 1px solid #eeeeee;
			    margin-bottom: 0.1rem;
			    padding: 0.2rem;
			    background-color: #f5f5f5;
			    overflow: hidden;
			}
			.content_center>.right li>h1.tit {
			    font-size: 0.2rem;
			    font-weight: bold;
			    line-height: 0.3rem;
			}
			.content_center>.right li>p.firm{
				font-size: 0.18rem;
			}
			.content_center>.right li>.welfare>span{
				width: 0.8rem;
			    height: 0.25rem;
			    background-color: #333333;
			    color: #fff;
			    border-radius: 0.03rem;
			    display: inline-block;
			    line-height: 0.25rem;
			    text-align: center;
			    margin-right: 0.2rem;
			}
			.content_center>.right li>.welfare .time{
				color: #999999;
				font-size: 0.16rem;
				display: inline-block;
				margin-left: 2.6rem;
			}
			.one_bott{
				width: 7.2rem;
			    margin: 0 auto;
			    margin-top: 0.3rem;
			    border-top: 1px solid #dbdbdb;
			}
			.one_bott>span{
				display: block;
			}
			.one_bott>.money{
				font-size: 0.26rem;
				color: #ff9900;
				margin-top: 0.1rem;
			}
			.one_bott>.require{
				color: #999999;
			}
			.one_bott>.require>span{
				padding: 0.05rem;
				display: inline-block;
			}
			.one_bott>.site{
				font-size: 0.16rem;
				overflow: hidden;
			}
			.message_list{
				width: 7.28rem;
				font-size: 0.14rem;
				overflow: hidden;
			}
			.message_bott>div li>div{
				width: 32%;
			}
			.content_center>.left{
				width: 4rem;
				display: inline-block;
				margin-left: 0.2rem;
			}
			.left>.imgs{
				width: 2.23rem;
				height: 2.23rem;
				display: block;
				margin: 0.15rem auto;
				background: url(../img/info.jpg) no-repeat center;
			}
			.left>p{
				margin: 0 0.2rem;
			}
            .enters{
                position:absolute;
                right:0;
            }
		</style>
	</head>
	<body>
		<header>
			<div class="head">
				<ul>
					<li class="tit">青海大学科技园企业服务平台</li>
					<li class="nav">
						<a href="../Default.aspx">首页</a>
						<a href="../Enterprise/Default.aspx">企业</a>
						<a href="../Finance/Default.aspx">融资</a>
						<a href="Default.aspx" class="active">招聘</a>
						<a href="../Information/Default.aspx">信息服务</a>
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
				<a href="Default.aspx">招聘</a>
				<span class="sep">/</span>
				<a>招聘详情</a>
			</div>
		</div>
		<div class="content">
			<div class="content_center">
				<div class="right">
					<ul>
						<li>
							<h1 class="tit" style="position:relative;">
								<%=hr.PositionName.Trim() %>
								<a href="Request.aspx?HrId=<%=hr.ID %>" class="enters" style="margin-left: 5rem;">填写申请表</a>
							</h1>
							<p class="firm"><%=hr.CompanyName %></p>
							<div class="welfare">
                                <%foreach (string s in hr.Welfare.Split(','))
                                    {if (s.Length == 0) continue; %>
								<span><%=s %></span>
                                <%} %>
							</div>
							<div class="one_bott">
								<span class="money"><%=hr.Salary %></span>
								<div class="require">
									<span><%=hr.Degree %>学历 </span>|
									<span><%=hr.Major %></span>|
									<span><%=hr.Trade %></span>|
									<span><%=hr.Depart %></span>|
									<span>创建时间 <%=hr.PostTime %></span>
								</div>
								<span class="site"><%=hr.RegisterAddr %></span>
							</div>
						</li>
						<li class="message">
							<h1 class="introduce_tit">职位描述</h1>
							<div class="message_list">
								<%=hr.Detail %>
							</div>
						</li>
						<li class="message message_bott" id="recruits">
							<h1 class="introduce_tit">企业招聘</h1>
							<div>
								<ul>
									<li class="list_bott">
										<div>职位名称</div>
										<div>公司部门</div>
										<div>薪资</div>
									</li>
                                <asp:Repeater ID="rpHrList" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <div><a href="Detail.aspx?ID=<%#Eval("ID") %>"><%#Eval("PositionName") %></a></div>
                                            <div><%#Eval("Depart") %></div>
                                            <div class="red"><%#Eval("Salary") %></div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<div class="left">
					<div class="imgs" style="background-image: url(<%#!object.Equals(null,hr.LogoPic)&&!string.IsNullOrEmpty(hr.LogoPic.Trim())?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],hr.LogoPic.Trim().Substring(0,4),hr.LogoPic.Trim().Substring(4,2),hr.LogoPic.Trim().Substring(6,2),hr.LogoPic.Trim()):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png")%>);"></div>
					<p>
						<%=Common.GetInstance.ReplaceHtmlTag(hr.CompanyIntr,200) %>
					</p>
					<a href="../Enterprise/EntHome.aspx?ID=<%=hr.EnterpriseId %>" class="enters" style="margin-top: 0.2rem;margin-bottom: 0.2rem; position:static;">进入企业首页</a>
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
