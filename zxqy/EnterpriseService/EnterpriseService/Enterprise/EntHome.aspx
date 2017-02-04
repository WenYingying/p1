<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntHome.aspx.cs" Inherits="Enterprise_EntHome" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>企业详情</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .content {
            height: 83.5%;
            top: 1.1rem;
        }

        .content_center {
            margin-top: 0 !important;
        }

        .message:first-child {
            width: 9.48rem;
            height: 2.43rem;
            font-size: 0.16rem;
            line-height: 0.35rem;
            padding: 0;
            border-radius: 0.02rem;
        }

        .message {
            width: 9.08rem;
            height: auto;
            padding: 0.2rem;
            border-radius: 0.02rem;
            display: inline-block;
            border: 1px solid #eeeeee;
            margin-bottom: 0.1rem;
            background-color: #f5f5f5;
            overflow: hidden;
        }

            .message > .left {
                width: 2.23rem;
                height: 2.23rem;
                display: inline-block;
                margin: 0.1rem;
                background-position: initial;
            }

            .message > .right {
                width: 6.8rem;
                height: 2.45rem;
                display: inline-block;
                margin-left: 0.2rem;
            }

        .right > .tit {
            font-size: 0.2rem;
            font-weight: bold;
            line-height: 0.5rem;
            margin-bottom: 0.5rem;
        }

        .right li > span {
            padding: 0 0.3rem;
        }

        .right span.website {
            background: url(../img/website.png) no-repeat top left;
        }

        .right span.times {
            background: url(../img/time.png) no-repeat top left;
        }

        .right span.house {
            background: url(../img/house.png) no-repeat top left;
        }

        .right span.money {
            background: url(../img/money.png) no-repeat top left;
        }

        .link {
            margin-top: 0.2rem;
        }

            .link > span {
                margin-left: 0.1rem;
            }

        .more {
            font-size: 0.18rem;
            font-weight: bold;
            padding-bottom: 0.06rem;
            margin-left: 7.7rem;
        }

        .cont_info > .info {
            width: 9.08rem;
            border: 0;
            margin-right: 0;
            border-bottom: 1px solid #dbdbdb;
        }

            .cont_info > .info:last-child {
                border-bottom: 0;
            }

            .cont_info > .info > .right {
                width: 6.6rem;
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
                    <a href="Default.aspx" class="active">企业</a>
                    <a href="../Finance/Default.aspx">融资</a>
                    <a href="../Hr/Default.aspx">招聘</a>
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
            <a href="Default.aspx">企业</a>
            <span class="sep">/</span>
            <a>企业详情</a>
        </div>
    </div>
    <div class="content">
        <div class="content_center">
            <div class="left">
                <ul>
                    <li class="list">
                        <a href="#referral" class="active">企业介绍</a>
                        <a href="#products">项目介绍</a>
                        <a href="#news">企业新闻</a>
                        <a href="#recruits">企业招聘</a>
                        <a href="../Finance/Default.aspx?EnterpriseId=<%=ent.ID %>">企业融资</a>
                    </li>
                </ul>
            </div>
            <div class="right">
                <ul>
                    <li class="message">
                        <div class="left" style="background-image: url(<%=!string.IsNullOrEmpty(ent.LogoPic)&&(ent.LogoPic.Length>0)?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LogoPic.Substring(0,4),ent.LogoPic.Substring(4,2),ent.LogoPic.Substring(6,2),ent.LogoPic):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png") %>);"></div>
                        <div class="right">
                            <h1 class="tit"><%=ent.CompanyName %></h1>
                            <ul>
                                <li>
                                    <span class="website">网　　站</span>
                                    <label><%=ent.Url %></label>
                                </li>
                                <li>
                                    <span class="times">成立时间</span>
                                    <label><%=Convert.ToDateTime(ent.CompanyRegTime).ToString("yyyy年MM月dd日") %></label>
                                </li>
                                <li>
                                    <span class="house">固定地址</span>
                                    <label><%=ent.RegisterAddr %></label>
                                </li>
                                <li>
                                    <span class="money">注册资本</span>
                                    <label><%=ent.Capital %>万</label>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="message" id="referral">
                        <h1 class="introduce_tit">企业介绍</h1>
                        <p class="introduce">
                            <%=ent.CompanyIntr %>
                        </p>
                    </li>
                    <li class="message" id="products">
                        <h1 class="introduce_tit">项目介绍</h1>
                        <p class="introduce"><%=ent.ProjectIntr %></p>
                    </li>
                    <li class="message cont_info" id="news">
                        <h1 class="introduce_tit">企业新闻</h1>
                        <a href="../Information/Default.aspx?Type=News&EnterpriseId=<%=ent.ID %>" class="more">更多</a>
                        <asp:Repeater ID="rpInfoList" runat="server">
                            <ItemTemplate>
                                <a href="../Information/Detail.aspx?ID=<%#Eval("ID") %>" class="info">
                                    <div class="left" style="background-image: url(<%#!object.Equals(null,Eval("CoverPic"))&&!string.IsNullOrEmpty(Eval("CoverPic").ToString().Trim())?string.Format("{0}InformationPic/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("CoverPic").ToString().Trim().Substring(0,4),Eval("CoverPic").ToString().Trim().Substring(4,2),Eval("CoverPic").ToString().Trim().Substring(6,2),Eval("CoverPic").ToString().Trim()):string.Format("{0}InformationPic/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoPic.png") %>);"></div>
                                    <div class="right">
                                        <ul>
                                            <li class="tit"><%#Eval("Title") %></li>
                                            <li class="time">
                                                <span class="iconfont"><%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy/MM/dd") %></span>
                                                <span class="iconfont">企业新闻</span>
                                            </li>
                                            <li class="text"><%#Common.GetInstance.ReplaceHtmlTag(Eval("Content").ToString(),500) %></li>
                                        </ul>
                                    </div>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </li>
                    <li class="message message_bott" id="recruits">
                        <h1 class="introduce_tit">企业招聘</h1>
                        <a href="../Hr/Default.aspx?EnterpriseId=<%=ent.ID %>" class="more">更多</a>
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
                                            <div><a href="../Hr/Detail.aspx?ID=<%#Eval("ID") %>"><%#Eval("PositionName") %></a></div>
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
        </div>
        <footer>
            copyright @ 2016青海大学企业服务平台 | ICP备15031425号-3
        </footer>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
</body>
</html>
