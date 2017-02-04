<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Information_Default" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagName="Pager" TagPrefix="uc" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息服务</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .cont_info > .info {
            width: 9.5rem;
            border-radius: 0.02rem;
        }

            .cont_info > .info > .right {
                width: 7rem;
            }

        .info:hover {
            box-shadow: 1px 3px 15px 3px #eaeaea;
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
    <div class="content">
        <div class="content_center">
            <div class="left">
                <ul>
                    <li class="list">
                        <a href="Default.aspx" class="active">全部</a>
                        <a href="Default.aspx?Type=News" data-type="news">新闻资讯</a>
                        <a href="Default.aspx?Type=Trade" data-type="trade">行业资讯</a>
                        <a href="Default.aspx?Type=Policy" data-type="policy">政策资讯</a>
                        <a href="Default.aspx?Type=Knowlage" data-type="knowlage">知识库</a>
                        <a href="Default.aspx?Type=Notice" data-type="notice">公告</a>
                    </li>
                </ul>
            </div>
            <div class="right cont_info">
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <a href="Detail.aspx?ID=<%#Eval("ID") %>" class="info">
                        <div class="left" style="background-image: url(<%#!object.Equals(null,Eval("CoverPic"))&&!string.IsNullOrEmpty(Eval("CoverPic").ToString().Trim())?string.Format("{0}InformationPic/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("CoverPic").ToString().Trim().Substring(0,4),Eval("CoverPic").ToString().Trim().Substring(4,2),Eval("CoverPic").ToString().Trim().Substring(6,2),Eval("CoverPic").ToString().Trim()):string.Format("{0}InformationPic/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoPic.png") %>);"></div>
                        <div class="right">
                            <ul>
                                <li class="tit"><%#Eval("Title") %></li>
                                <li class="time">
                                    <span class="iconfont"><%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy/MM/dd") %></span>
                                    <span class="iconfont"><%#Eval("Type") %></span>
                                </li>
                                <li class="text"><%#Common.GetInstance.ReplaceHtmlTag(Eval("Content").ToString(),500) %></li>
                            </ul>
                        </div>
                    </a>
                    </ItemTemplate>
                </asp:Repeater>
                <uc:Pager runat="server" ID="pager" />
            </div>
        </div>
        <footer>
            copyright @ 2016青海大学企业服务平台 | ICP备15031425号-3
        </footer>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/Common.js"></script>
    <script type="text/javascript">
        $(function () {
            <%if(!string.IsNullOrEmpty(Request.QueryString["Type"])) {%>
            $("a[data-type='<%=Request.QueryString["Type"].ToLower().Trim()%>']").addClass("active").siblings("a").removeClass("active");
            <%}%>
        });
    </script>
</body>
</html>
