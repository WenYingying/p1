<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Finance_Detail" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>融资详情</title>
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

            .content_center > .left {
                background: url(../img/left_img.jpg) no-repeat;
                width: 4rem;
                height: 4rem;
                display: inline-block;
                margin-left: 0.2rem;
            }

            .content_center > .right {
                width: 7.7rem;
                display: inline-block;
                margin-left: 0;
            }

        .message {
            font-size: 0.16rem;
            line-height: 0.35rem;
            border-radius: 0.02rem;
            display: inline-block;
            border: 1px solid #eeeeee;
            margin-bottom: 0.1rem;
            padding: 0.2rem;
            background-color: #f5f5f5;
            overflow: hidden;
            width:100%;
        }

            .message > .left {
                width: 2.23rem;
                height: 2.23rem;
                display: inline-block;
                margin: 0.1rem;
                background-position: initial;
            }

            .message > .right {
                width: 5rem;
                height: 2.43rem;
                display: inline-block;
                margin-left: 0.2rem;
            }

                .message > .right .tit {
                    font-size: 0.2rem;
                    font-weight: bold;
                    line-height: 0.5rem;
                    margin-bottom: 0.5rem;
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

        .right li > span {
            padding: 0 0.3rem;
        }

        .bott {
            width: 7.2rem;
            margin: 0 auto;
            margin-top: 0.3rem;
            text-align: center;
            border-top: 1px solid #dbdbdb;
        }

            .bott li {
                margin: 0.15rem 0;
                display: inline-block;
            }

                .bott li:last-child {
                    margin-right: 0rem;
                }

                .bott li > div {
                    color: #a40000;
                    font-size: 0.14rem;
                }

                .bott li > span {
                    font-size: 0.2rem;
                }
                .introduce{
                    margin:0.2rem;
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
                    <a href="Default.aspx" class="active">融资</a>
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
            <a href="Default.aspx">融资</a>
            <span class="sep">/</span>
            <a>融资详情</a>
        </div>
    </div>
    <div class="content">
        <div class="content_center">
            <div class="right">
                <ul>
                    <li class="message" style="width: 7.7rem; height: 3.96rem; padding: 0;">
                        <div class="left" style="background-image: url(<%=!string.IsNullOrEmpty(ent.LogoPic)?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LogoPic.Substring(0,4),ent.LogoPic.Substring(4,2),ent.LogoPic.Substring(6,2),ent.LogoPic):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png") %>);"></div>
                        <div class="right">
                            <a href="../Enterprise/EntHome.aspx?ID=<%=fi.EnterpriseId %>">
                                <h1 class="tit"><%=fi.CompanyName %></h1>
                            </a>
                            <ul>
                                <li>
                                    <span class="website">网  站</span>
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
                        <div class="bott">
                            <ul>
                                <li>
                                    <div>融资规模</div>
                                    <span><%=((long)fi.Money).ToString("###,###") %>万</span>
                                </li>
                                <li>
                                    <div>预期收益</div>
                                    <span><%=fi.Profit %></span>
                                </li>
                                <li>
                                    <div>让出股权</div>
                                    <span><%=fi.Stock %></span>
                                </li>
                                <li>
                                    <div>联系方式</div>
                                    <span><%=fi.Mobile.Trim() %></span>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="message">
                        <h1 class="introduce_tit">融资说明</h1>
                        <p class="introduce">
                            <%=fi.Detail %>
                        </p>
                    </li>
                    <li class="message">
                        <h1 class="introduce_tit">项目介绍</h1>
                        <p class="introduce">
                            <%=fi.ProjectIntr %>
                        </p>
                    </li>
                </ul>
            </div>
            <div class="left"></div>
        </div>
        <footer>
            copyright @ 2016青海大学企业服务平台 | ICP备15031425号-3
        </footer>
    </div>
</body>
<script src="../js/jquery-3.1.0.min.js"></script>
<script src="../js/Common.js"></script>
</html>
