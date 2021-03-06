﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Hr_Default" %>
<%@ Register Src="~/UserControls/ucPager.ascx" TagName="Pager" TagPrefix="uc" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>招聘</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .financing:nth-child(2n+0), .recruit:nth-child(2n+0), .info:nth-child(2n+0) {
            margin-right: 0rem;
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
    <div class="content">
        <div class="search">
            <a href="javascript:void(0)">
                <input type="search" name="" id="" value="<%=!string.IsNullOrEmpty(Request.QueryString["KeyWord"])?Server.UrlDecode(Request.QueryString["KeyWord"]):string.Empty %>" placeholder="请输入企业名称/招聘岗位" />
                <span id="searchBtn">查找</span>
            </a>
        </div>
        <div class="content_list cont_recruit">
            <asp:Repeater ID="rpList" runat="server">
                <ItemTemplate>
                    <a href="Detail.aspx?ID=<%#Eval("ID") %>" class="recruit">
                        <div class="left" style="background-image: url(<%#!object.Equals(null,Eval("LogoPic"))&&Eval("LogoPic").ToString().Trim().Length>0?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("LogoPic").ToString().Trim().Substring(0,4),Eval("LogoPic").ToString().Trim().Substring(4,2),Eval("LogoPic").ToString().Trim().Substring(6,2),Eval("LogoPic").ToString().Trim()):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png")%>);"></div>
                        <div class="right">
                            <ul>
                                <li class="tit"><%#Eval("PositionName") %></li>
                                <li class="firm"><%#Eval("CompanyName") %></li>
                                <li class="welfare" style="height:0.25rem; overflow:hidden;">
                                    <asp:Literal ID="liWelFare" runat="server"></asp:Literal>
                                </li>
                                <li class="require">
                                    <span class="red"><%#Eval("Salary") %></span>|
								<span><%#Eval("Degree") %>学历</span>|
								<span><%#Eval("Major") %>专业</span>
                                </li>
                                <li class="time">
                                    <span><%#Convert.ToDateTime(Eval("LastUpdateTime")).ToString("yyyy/MM/dd") %>最后修改</span>|
								<span><%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy/MM/dd") %>发布</span>
                                </li>
                            </ul>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
            <uc:Pager runat="server" ID="pager" />
        </div>
        <footer>
            copyright @ 2016青海大学企业服务平台 | ICP备15031425号-3
        </footer>
    </div>
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/Common.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#searchBtn").click(function () {
                var keyword = $.trim($(this).siblings("input:eq(0)").val());
                if (keyword.length == 0)
                {
                    alert("请输入关键字");
                    return;
                }
                location.href = "Default.aspx?KeyWord=" + escape(keyword);
            });
        });
    </script>
</body>
</html>
