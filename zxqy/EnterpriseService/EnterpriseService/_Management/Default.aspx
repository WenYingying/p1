<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Management_Default" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>青海大学国家大学科技园企业服务平台运营后台</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <style type="text/css">
        header {
            width: 100%;
            height: 0.6rem;
            line-height: 0.6rem;
            color: #FFFFFF;
            background-color: #32323a;
            position: fixed;
            top: 0;
            left: 0;
            overflow: hidden;
        }

            header > h1 {
                width: 3.8rem;
                font-size: 0.2rem;
                font-weight: bold;
                margin-left: 0.2rem;
                float: left;
                display: inline;
            }

            header > .exit {
                float: right;
                display: inline;
                border-left: 4px solid #000000;
            }

                header > .exit > a {
                    color: #fff;
                    padding: 0 0.2rem;
                    display: block;
                    border-left: 2px solid #4e4f50;
                }

        .content {
            width: 100%;
            margin-top: 0.6rem;
        }

            .content > .c_left {
                width: 14.7%;
                height: 100%;
                color: #c9c9c9;
                background-color: #32323a;
                position: fixed;
                top: 0.6rem;
                left: 0;
            }

        .c_left .menu_head {
            margin-bottom: 0.2rem;
            border-top: 1px solid #5a5a66;
        }

            .c_left .menu_head > div {
                margin-top: 0.4rem;
                display: inline-block;
            }

        .c_left .apply {
            width: 0.36rem;
            height: 0.2rem;
            line-height: 0.2rem;
            text-align: center;
            color: #c9c9c9;
            display: block;
            font-size: 0.12rem;
            border-radius: 0.03rem;
            background-color: #a40000;
        }

        .c_left .portrait {
            width: 0.5rem;
            height: 0.5rem;
            border-radius: 50%;
            margin: 0 0.1rem;
            border: 1px solid #cfcfcf;
            display: inline-block;
            vertical-align: top;
            overflow: hidden;
        }

            .c_left .portrait > img {
                width: 100%;
                height: 100%;
                display: block;
            }

        .c_left .portrait_info {
            width: 1rem;
            line-height: 0.3rem;
            overflow: hidden;
        }

            .c_left .portrait_info > span {
                display: block;
            }

        .content > .c_left .menu::-webkit-scrollbar {
            width: 2px;
            background-color: #000;
        }

        .menu {
            width: 100%;
            height: 69%;
            overflow-y: auto;
        }

            .menu > ul > li {
                width: 100%;
                line-height: 0.6rem;
            }

            .menu a {
                color: #c9c9c9;
            }

            .menu > ul > li > a {
                font-size: 0.14rem;
                text-indent: 0.1rem;
                display: block;
                border-top: 1px solid #5A5A66;
                border-bottom: 1px solid #5A5A66;
            }

            .menu a .arrow {
                display: inline-block;
                width: 0.15rem;
                height: 0.06rem;
                background-image: url("img/arrow.png");
                background-position: 0 bottom;
                float: right;
                margin-top: 0.27rem;
                margin-right: 0.2rem;
            }

            .menu a .open {
                background-position: 0 top;
            }

        .s_menu {
            display: none;
        }

            .s_menu a {
                width: 100%;
                line-height: 0.5rem;
                display: block;
                text-indent: 0.35rem;
            }

            .s_menu > a:hover {
                color: #A40000;
            }

        .c_right {
            width: 85.3%;
            margin-left: 14.7%;
            display: inline-block;
        }
    </style>
</head>
<body>
    <header>
        <h1>青海大学国家大学科技园企业服务平台运营后台 </h1>
        <div class="exit">
            <a href="../Handler/AdminLogoutHandler.ashx">退出</a>
        </div>
    </header>
    <div class="content">
        <div class="c_left">
            <div class="menu_head">
                <div class="portrait">
                    <img src="img/portrait.png">
                </div>
                <div class="portrait_info">
                    <span><%=Server.UrlDecode( Request.Cookies["Admin"]["Name"]) %></span>
                    <span>服务平台人员</span>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li>
                        <a href="javascript:void(0)" data-role="menuItem">网站管理
								<i class="arrow"></i>
                        </a>
                        <div class="s_menu">
                            <a href="Settings/Banner.aspx" target="Iframe">Banner管理</a>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:void(0)" data-role="menuItem" data-tag="Ent">企业库
								<i class="arrow"></i>
                        </a>
                        <div class="s_menu">
                            <a href="Enterprise/Default.aspx?State=0" target="Iframe">入住企业审核</a>
                            <a href="Enterprise/SuccessList.aspx" target="Iframe">已入孵经营企业</a>
                            <a href="Enterprise/FailList.aspx" target="Iframe">被驳回企业</a>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:void(0)" data-role="menuItem" data-tag="Finance">融资管理
								<i class="arrow"></i>
                        </a>
                        <div class="s_menu">
                            <a href="Finance/Default.aspx?State=0" target="Iframe">待审核融资</a>
                            <a href="Finance/Default.aspx?State=1" target="Iframe">融资中列表</a>
                            <a href="Finance/Default.aspx?State=-1" target="Iframe">被驳回融资列表</a>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:void(0)" data-role="menuItem" data-tag="Info">信息库
								<i class="arrow"></i>
                        </a>
                        <div class="s_menu">
                            <a href="Information/EntNews.aspx?State=0" target="Iframe">企业新闻</a>
                            <a href="Information/Default.aspx?Type=News" target="Iframe">行业新闻</a>
                            <a href="Information/Default.aspx?Type=Policy" target="Iframe">政策法规</a>
                            <a href="Information/Default.aspx?Type=Knowlage" target="Iframe">知识库</a>
                            <a href="Information/Default.aspx?Type=Notice" target="Iframe">公告</a>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:void(0)" data-role="menuItem" data-tag="Hr">招聘管理
								<i class="arrow"></i>
                        </a>
                        <div class="s_menu">
                            <a href="Hr/Default.aspx" target="Iframe">岗位库</a>
                            <a href="Hr/Resum.aspx" target="Iframe">人才库</a>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:void(0)" data-role="menuItem" data-tag="Meeting">会议预约管理
								<i class="arrow"></i>
                        </a>
                        <div class="s_menu">
                            <a href="ConferenceRoom/RequestList.aspx?State=0" target="Iframe">会议室预约审核</a>
                            <a href="ConferenceRoom/RequestList.aspx?State=1" target="Iframe">会议室使用</a>
                            <a href="ConferenceRoom/RequestList.aspx?State=-1" target="Iframe">会议室使用驳回</a>
                            <a href="ConferenceRoom/Default.aspx" target="Iframe">会议室列表</a>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:void(0)" data-role="menuItem" data-tag="Admin">管理员管理
								<i class="arrow"></i>
                        </a>
                        <div class="s_menu">
                            <a href="Admin/Default.aspx" target="Iframe">管理员列表</a>
                            <a href="Admin/Add.aspx" target="Iframe">添加管理员账户</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="c_right">
            <iframe src="WelCome.aspx" name="Iframe" class="IndexIframe" style="width: 100%; height: 100%; border: none;"></iframe>
        </div>
    </div>

    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.IndexIframe').css('height', '' + ($(window).height() - 60) + 'px');
            $('.IndexIframe').css('width', '' + ($(window).width() - 200) + 'px');
            $(window).on('resize', function () {
                $('.IndexIframe').css('height', '' + ($(window).height() - 60) + 'px');
                $('.IndexIframe').css('width', '' + ($(window).width() - 200) + 'px');
            })
            //			    左侧导航
            $("a[data-role='menuItem']").click(function () {
                if ($(this).children("i").hasClass("open")) {
                    $(this).children("i").removeClass("open");
                    $(this).siblings(".s_menu").hide();
                    return;
                }
                $(this).children("i").addClass("open");
                $(".s_menu:not(:hidden)").hide().siblings("a[data-role='menuItem']").children("i").removeClass("open");
                $(this).siblings(".s_menu").show();
                $(this).siblings(".s_menu").children("a:eq(0)").click();
                $("iframe").attr("src", $(this).siblings(".s_menu").children("a:eq(0)").prop("href"));
                $(".menu").scrollTop($(this).offset().top-200);
            });
            $(".s_menu a").click(function () {
                $(this).addClass("active").siblings("a").removeClass("active");
                return true;
            });
        });
		</script>
</body>
</html>
