<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>青海大学国家大学科技园企业服务平台</title>
    <meta content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <style type="text/css">
        header {
            border-bottom: 0;
        }

        .banner {
            position: relative;
            width: 100% !important;
            height: 3.6rem;
            overflow: hidden;
        }

            .banner > div {
                width: 100%;
                height: 100%;
                background-size: cover;
                background-repeat: no-repeat;
                position: absolute;
                top: 0;
                left: 0;
                background-color: transparent;
                opacity: 0;
                animation: imageAnimation 12s infinite linear;
                -moz-animation: imageAnimation 12s infinite linear;
                -webkit-animation: imageAnimation 12s infinite linear;
                -o-animation: imageAnimation 12s infinite linear;
            }

        @-webkit-keyframes imageAnimation {
            4% {
                opacity: 0;
                animation-timing-function: ease-in;
            }

            17% {
                opacity: 1;
                animation-timing-function: ease-out;
            }

            100% {
                opacity: 0;
            }
        }

        @-moz-keyframes imageAnimation {
            4% {
                opacity: 0;
                animation-timing-function: ease-in;
            }

            17% {
                opacity: 1;
                animation-timing-function: ease-out;
            }

            100% {
                opacity: 0;
            }
        }

        @-o-keyframes imageAnimation {
            4% {
                opacity: 0;
                animation-timing-function: ease-in;
            }

            17% {
                opacity: 1;
                animation-timing-function: ease-out;
            }

            100% {
                opacity: 0;
            }
        }

        @-ms-keyframes imageAnimation {
            4% {
                opacity: 0;
                animation-timing-function: ease-in;
            }

            17% {
                opacity: 1;
                animation-timing-function: ease-out;
            }

            100% {
                opacity: 0;
            }
        }

        @keyframes imageAnimation {
            4% {
                opacity: 0;
                animation-timing-function: ease-in;
            }

            17% {
                opacity: 1;
                animation-timing-function: ease-out;
            }

            100% {
                opacity: 0;
            }
        }

        .content .title {
            width: 100%;
            border-bottom: 2px solid #e6e6e6;
            padding-bottom: 0.1rem;
            margin-bottom: 0.4rem;
            text-indent: 0;
        }

            .content .title > a {
                font-size: 0.18rem;
                font-weight: bold;
                padding-bottom: 0.06rem;
            }

                .content .title > a:first-child {
                    border-bottom: 4px solid #a40000;
                }

                .content .title > a.more {
                    float: right;
                }

        .introduce > p {
            text-indent: 0.3rem;
            font-size: 0.16rem;
            line-height: 0.25rem;
        }

        .guide > a {
            width: 3.9rem;
            height: 1.96rem;
            display: inline-block;
            background-image: url(img/guide.jpg);
            background-repeat: no-repeat;
            background-size: 100%;
            margin-right: 0.1rem;
            margin-bottom: 0.5rem;
            overflow: hidden;
        }

            .guide > a:last-child {
                margin-right: 0;
            }

            .guide > a > span {
                width: 100%;
                text-align: center;
                color: #fff;
                font-size: 0.2rem;
                font-weight: bold;
                display: block;
                line-height: 1.96rem;
            }

            .guide > a > p {
                width: 3.1rem;
                height: 1.35rem;
                color: #fff;
                font-size: 0.14rem;
                margin: 0.3rem 0.4rem;
                overflow: hidden;
                display: none;
            }

            .guide > a:hover p {
                display: block;
            }

            .guide > a:hover span {
                display: none;
            }

        .flow li {
            width: 2.9rem;
            display: inline-block;
            text-align: center;
        }

            .flow li > a {
                font-weight: bold;
                font-size: 0.18rem;
            }

                .flow li > a > i {
                    /*width: 1rem;
	        	height: 1rem;*/
                    font-size: 0.9rem;
                    display: block;
                    margin: 0 auto;
                    margin-bottom: 0.2rem;
                    overflow: hidden;
                }

            .flow li span {
                font-size: 0.16rem;
                margin-top: 0.2rem;
                display: block;
            }

        .flow .attestation > a {
            color: #22ac38;
        }

        .flow .serve > a {
            color: #ec6941;
        }

        .flow .enter > a {
            color: #0075a9;
        }

        .flow .price > a {
            color: #a40000;
        }

        .financing:nth-child(2n+1), .recruit:nth-child(2n+1), .info:nth-child(2n+1) {
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
                    <a href="Default.aspx" class="active">首页</a>
                    <a href="Enterprise/Default.aspx">企业</a>
                    <a href="Finance/Default.aspx">融资</a>
                    <a href="Hr/Default.aspx">招聘</a>
                    <a href="Information/Default.aspx">信息服务</a>
                </li>
                <li>
                    <%if (object.Equals(null, Request.Cookies["User"]))
                        { %>
                    <a href="request.html" class="apply">申请入驻</a>
                    <a href="login.html" class="login">登录</a>
                    <%}
                    else
                    { %>
                    <a href="javascript:void(0)" class="end"><%=Server.UrlDecode(Request.Cookies["User"]["Name"]) %>/退出</a>
                    <div class="hide">
                        <a href="EnterpriseManage/Default.aspx">管理</a>
                        <a href="Enterprise/EntHome.aspx?ID=<%=Request.Cookies["User"]["EnterpriseID"] %>">我的企业</a>
                        <a href="login.html">退出</a>
                    </div>
                    <%} %>
                </li>
            </ul>
        </div>
    </header>
    <div class="content">
        <div class="banner">
            <asp:Repeater ID="rpBannerList" runat="server">
                <ItemTemplate>
                    <div style="background-image: url(<%#!object.Equals(null,Eval("FileName"))&&Eval("FileName").ToString().Trim().Length>0?string.Format("{0}BannerFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("FileName").ToString().Trim().Substring(0,4),Eval("FileName").ToString().Trim().Substring(4,2),Eval("FileName").ToString().Trim().Substring(6,2),Eval("FileName").ToString().Trim()):string.Format("{0}BannerFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png")%>); animation-delay: <%#Container.ItemIndex*3 %>s;"></div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="introduce">
            <h1 class="title">
                <a>科技园介绍/Introduce</a>
            </h1>
            <p>
                青海大学国家大学科技园2004年经省科技厅批复开始组建，2014年获批国家级大学科技园，目前是国内115所国家级大学科技园之一，是青海省唯一一所国家级大学科技园。
            </p>
            <p>
                青海大学国家大学科技园是青海省内唯一一所国家级大学科技园，目前处于规划阶段，缺乏相关的建设经验，由于自然环境及社会环境的影响，信息化建设比较落后，目前信息收集都是通过人工进行收集，存在信息碎片化，传递人工化，存在效率低，信息不对称，协同滞后等问题，急需一个标准化的互联网信息系统作为服务平台，推动园区企业管理和服务工作，提高科技园整体的运营能力。
            </p>
        </div>
        <div>
            <ul>
                <li class="title">
                    <a>新手指引/Guide</a>
                </li>
                <li class="guide">
                    <a href="javascript:void(0)">
                        <span>什么是企业服务平台？</span>
                        <p>
                            企业服务平台主要是为创业者与创业团队提供综合创业指导与服务的机构。其提供的创业服务可以包括： 创业指导与咨询，启动资金，工商注册，财务税务法务，人事招聘，市场咨询，产品打磨与优化，办公空间，等等创业者所需要的全方位的服务。
                        </p>
                    </a>
                    <a href="javascript:void(0)">
                        <span>能给创业者提供什么样的帮助？</span>
                        <p>
                            作为一个基于本地化服务，集合了相对完整创业资源包的高端创业服务机构，可以为创业者提供创业导师咨询，创业基础教育，投融资对接，工商注册，财务税务法务，人事招聘，办公场地，市场咨询与优化，产品打磨与优化，以及为创业者提供了一个优质的寻找创业合伙人的场所，创业伙伴的场所。
                        </p>
                    </a>
                    <a href="javascript:void(0)">
                        <span>已有哪些项目或公司入住？</span>
                        <p>
                            会会、创客贴、FView、洗爱车、鲜旅客、玩聚-北京、青年菜君、TVR、oxcoder猿圈、黄油相机、石墨文档、MikeCRM麦客、海猫季、花果金融、触景无限、景点通、DreamMobi、车生活、E家修、邮差、美厨、组队、小脸猫、相投、食探、微中医、橘子图片、Visens、淘心...
                        </p>
                    </a>
                </li>
                <li class="flow">
                    <div>
                        <ul>
                            <li class="attestation">
                                <a>
                                    <i class="iconfont">&#xe605;</i>
                                    资质认证
                                </a>
                                <span>企业用户100%资质认证</span>
                            </li>
                            <li class="serve">
                                <a>
                                    <i class="iconfont">&#xe603;</i>
                                    专业资讯服务
                                </a>
                                <span>专业服务团队，为您提供资讯服务</span>
                            </li>
                            <li class="enter">
                                <a>
                                    <i class="iconfont">&#xe600;</i>
                                    安心入驻
                                </a>
                                <span>审核通过后，可安心入驻</span>
                            </li>
                            <li class="price">
                                <a>
                                    <i class="iconfont">&#xe602;</i>
                                    价格透明
                                </a>
                                <span>服务价格其服务商实力一目了然</span>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <!--企业列表-->
        <div>
            <h1 class="title">
                <a>入驻企业/Enterprise </a>
                <a href="Enterprise/Default.aspx" class="more">更多</a>
            </h1>
            <asp:Repeater ID="rpEntList" runat="server">
                <ItemTemplate>
                    <a href="Enterprise/EntHome.aspx?ID=<%#Eval("ID") %>" class="enterprise" target="_blank">
                        <div class="pic" style="background-image: url(<%#!object.Equals(null,Eval("LogoPic"))&&Eval("LogoPic").ToString().Trim().Length>0?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("LogoPic").ToString().Trim().Substring(0,4),Eval("LogoPic").ToString().Trim().Substring(4,2),Eval("LogoPic").ToString().Trim().Substring(6,2),Eval("LogoPic").ToString().Trim()):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png")%>);"></div>
                        <div class="foot">
                            <h1><%#Eval("CompanyName") %></h1>
                            <div></div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!--融资列表-->
        <div>
            <h1 class="title">
                <a>融资/Financing</a>
                <a href="Finance/Default.aspx" class="more">更多</a>
            </h1>
            <asp:Repeater ID="rpFinanceList" runat="server">
                <ItemTemplate>
                    <a href="Finance/Detail.aspx?ID=<%#Eval("ID") %>" class="financing" target="_blank">
                        <div class="left" style="background-image: url(<%#!object.Equals(null,Eval("LogoPic"))&&Eval("LogoPic").ToString().Trim().Length>0?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("LogoPic").ToString().Trim().Substring(0,4),Eval("LogoPic").ToString().Trim().Substring(4,2),Eval("LogoPic").ToString().Trim().Substring(6,2),Eval("LogoPic").ToString().Trim()):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png")%>);"></div>
                        <div class="right">
                            <ul>
                                <li class="tit"><%#Eval("CompanyName") %></li>
                                <li class="cont"><%#Common.GetInstance.ReplaceHtmlTag( Eval("Detail").ToString(),500) %>
                                </li>
                                <li class="money">
                                    <span>融资规模<%#Convert.ToInt64(Eval("Money")).ToString("###,###") %>万</span>
                                    <span>预期收益<%#Eval("Profit") %>万</span>
                                </li>
                                <li class="time">
                                    <span>发布时间：<%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy/MM/dd") %></span>
                                    <span></span>
                                </li>
                            </ul>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!--招聘列表-->
        <div class="cont_recruit">
            <h1 class="title">
                <a>招聘/Human Resource</a>
                <a href="Hr/Default.aspx" class="more">更多</a>
            </h1>
            <asp:Repeater ID="rpHrList" runat="server">
                <ItemTemplate>
                    <a href="Hr/Detail.aspx?ID=<%#Eval("ID") %>" class="recruit" target="_blank">
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
        </div>
        <!--信息列表-->
        <div class="cont_info">
            <h1 class="title">
                <a>信息服务/Information </a>
                <a href="Information/Default.aspx" class="more">更多</a>
            </h1>
            <asp:Repeater ID="rpInfoList" runat="server">
                <ItemTemplate>
                    <a href="Information/Detail.aspx?ID=<%#Eval("ID") %>" class="info" target="_blank">
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
        </div>
        <footer>
            copyright @ 2016青海大学企业服务平台 | ICP备15031425号-3
        </footer>
    </div>

    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $("header .nav>a").click(function () {
                $(this).addClass("active").siblings("a").removeClass("active");
            });
        });
    </script>
</body>
</html>
