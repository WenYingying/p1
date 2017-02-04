<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="EnterpriseManage_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>青海大学国家大学科技园企业服务平台-管理首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
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
                    <a href="../Information/Default.aspx">信息服务</a>
                </li>
                <li>
                    <a href="javascript:void(0)" class="end"><%=user.Name %>/退出</a>
                    <div class="hide">
                        <a href="Default.aspx">管理</a>
                        <a href="../login.html">退出</a>
                    </div>
                </li>
            </ul>
        </div>
    </header>
    <div class="content">
        <div class="content_center">
            <div class="left">
                <ul>
                    <li class="info">
                        <div class="portrait">
                            <img src="../img/portrait.png" />
                        </div>
                        <div class="portrait_info">
                            <span><%=user.Name %></span>
                            <span><%=string.Format("{0}****{1}",user.Mobile.Substring(0,3),user.Mobile.Substring(7,4)) %></span>
                            <%if (user.EnterpriseState > 2)
                                { %>
                            <a href="../Enterprise/EntHome.aspx?ID=<%=user.EnterpriseId %>" class="apply" target="_blank">进入企业首页</a>
                            <%} %>
                        </div>
                    </li>
                    <li class="list">
                        <%if (user.EnterpriseState < 3)
                            { %>
                        <a href="EnterpriseInfo/RequestState.aspx" data-menu="Ent" data-tag="EnterpriseInfo">申请进度查询</a>
                        <%}
                                else
                                { %>
                        <a href="EnterpriseInfo/Default.aspx" data-menu="Ent">企业信息</a>
                        <a href="Conference/Default.aspx" data-menu="Meeting" data-tag="Conference">预约会议室管理</a>
                        <a href="Financing/Default.aspx" data-menu="Finance" data-tag="Financing">融资管理</a>
                        <a href="News/Default.aspx" data-menu="News" data-tag="News">新闻管理</a>
                        <a href="Hr/Default.aspx" class="recruit" data-menu="Hr" data-tag="Hr">招聘管理</a>
                        <div class="recruit_hide hide">
                            <a href="Hr/Default.aspx" class="red">招聘职位</a>
                            <a href="Hr/Resum.aspx">查看简历</a>
                        </div>
                        <a href="User/Default.aspx" data-menu="User" data-tag="User">用户管理</a>
                        <a href="User/UpdatePassword.aspx" class="account" data-menu="Set">账户设置</a>
                        <%} %>
                    </li>
                </ul>
            </div>
            <div class="right">
                <div class="bottom">
                    <img src="../img/welcome.png" style="width:100%;" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            <%if(user.Permission.Trim()!="all") {%>
            $("[data-tag]").hide();
            var permission=<%=user.Permission%>;
            for(var i in permission)
            {
                $("[data-tag='"+i+"']").show();
            }
            <%}%>
        });
    </script>
</body>
</html>
