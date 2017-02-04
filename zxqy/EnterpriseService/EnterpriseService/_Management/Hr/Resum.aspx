<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Resum.aspx.cs" Inherits="_Management_Hr_Resum" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="pager" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>人才库</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .list_top {
            width: 100%;
            height: 0.6rem;
            line-height: 0.6rem;
            background-color: #f5f5f5;
        }

            .list_top li {
                display: inline-block;
            }

                .list_top li:first-child:after {
                    content: "|";
                    color: #959595;
                    font-size: 0.2rem;
                    padding-left: 0.3rem;
                }

                .list_top li > span {
                    width: 0.8rem;
                    text-align: right;
                    margin-right: 0.05rem;
                    color: #959595;
                    font-size: 0.14rem;
                    display: inline-block;
                }

                .list_top li > div {
                    display: inline-block;
                }

                .list_top li:first-child > div {
                    width: 2rem;
                }

                .list_top li > div > input, .list_top li > div > select {
                    width: 2rem;
                    height: 0.3rem;
                    line-height: 0.3rem;
                    border: 1px solid #dcdcdc;
                    text-indent: 0.1rem;
                    background-color: #fff;
                }

                .list_top li:last-child {
                    margin-left: 1rem;
                }

        .iframe_right .list li > div:nth-child(1) {
            width: 10%;
            text-indent: 0.2rem;
        }

        .iframe_right .list li > div:nth-child(2) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(3) {
            width: 23%;
        }

        .iframe_right .list li > div:nth-child(4) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(5) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(6) {
            width: 8%;
            text-align: center;
        }

        .iframe_right .list li > div:nth-child(7) {
            width: 22%;
        }

        .alert_box div {
            width: 4.7rem;
        }

        .top, .no_top {
            width: 0.25rem;
            height: 0.25rem;
            line-height: 0.25rem;
            text-align: center;
            border-radius: 50%;
            color: #fff;
            font-size: 0.14rem;
            background-color: #f19149;
            display: inline-block;
        }

        .no_top {
            background-color: #e60012;
        }

        .banner_img {
            width: 1.36rem !important;
            height: 1rem;
            display: inline-block;
            background: url(../img/banner_img.png) no-repeat center;
            vertical-align: top;
            border: 1px solid #dcdcdc;
            position: relative;
        }

            .banner_img > a {
                width: 1.36rem;
                height: 0.32rem;
                line-height: 0.32rem;
                color: #fff;
                font-size: 0.12rem;
                background-color: rgba(0,0,0,.6);
                position: absolute;
                bottom: 0;
                left: 0;
                text-align: center;
            }
            .alert_box span{
                font-weight:bold;
            }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2>人才库</h2>
        </div>
        <%--<div class="list_top">
            <ul>
                <li>
                    <span>企业名称</span>
                    <div>
                        <input type="text" name="" id="" value="" placeholder="请输入企业名称" />
                    </div>
                </li>
                <li>
                    <span>日期</span>
                    <div>
                        <select name="">
                            <option value="">2016-11-21</option>
                            <option value="">2016-11-21</option>
                        </select>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)" class="btn">查找</a>
                </li>
            </ul>
        </div>--%>
        <div class="list">
            <ul>
                <li>
                    <div>序列</div>
                    <div>姓名</div>
                    <div>应聘岗位</div>
                    <div>学历</div>
                    <div>工作年限</div>
                    <div>附件简历</div>
                    <div>操作</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("Name") %></div>
                            <div><%#Eval("PositionName") %></div>
                            <div><%#Eval("Degree") %></div>
                            <div><%#Convert.ToInt32(Eval("WorkYears"))==0?"应届毕业生":Eval("WorkYears").ToString()+"年" %></div>
                            <div>
                                <%#Eval("OffLinePath").ToString().Trim().Length==0?"无":"有" %>
                            </div>
                            <div>
                                <a href="javascript:(0)" class="btns add" onclick="ShowDetail({ID:<%#Eval("ID") %>,Name:'<%#Eval("Name")%>',BirthDay:'<%#Convert.ToDateTime(Eval("BirthDay")).ToString("yyyy/MM/dd")%>',Mobile:'<%#Eval("Mobile")%>',WorkYears:'<%#Convert.ToInt32(Eval("WorkYears"))==0?"应届生":Eval("WorkYears").ToString()+"年" %>',Addr:'<%#Eval("Addr")%>',Introduce:'<%#Eval("Introduce")%>',Degree:'<%#Eval("Degree")%>',OfflinePath:'<%#Eval("OfflinePath")%>',PositionName:'<%#Eval("PositionName")%>',State:<%#Eval("State") %>})">查看</a>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <uc:pager runat="server" ID="pager" />
        </div>
    </div>
    <div class="alert add_alert">
        <div class="alert_head">
            <h2>人才信息</h2>
            <a href="javascript:void(0)" class="iconfont close">&#xe621;</a>
        </div>
        <div class="alert_box">
            <ul>
                <li>
                    <span>姓名</span>
                    <div data-role="Name">李生</div>
                </li>
                <li>
                    <span>学历</span>
                    <div data-role="Degree">343417839@qq.com</div>
                </li>
                <li>
                    <span>应聘职位</span>
                    <div data-role="PositionName">销售经理</div>
                </li>
                <li>
                    <span>手机号码</span>
                    <div data-role="Mobile">13888888888</div>
                </li>
                <li>
                    <span>出生日期</span>
                    <div data-role="BirthDay">1992/06/25</div>
                </li>
                <li>
                    <span>附件简历</span>
                    <div><a href="javascript:void(0)" data-role="OfflinePath">下载</a></div>
                </li>
                <li class="breadth">
                    <span>工作年限</span>
                    <div data-role="WorkYears">2年</div>
                </li>
                <li class="breadth">
                    <span>居住地点</span>
                    <div data-role="Addr">北京市朝阳区分钟寺四道口</div>
                </li>
                <li class="breadth">
                    <span>自我介绍</span>
                    <div data-role="Introduce">
                        <p>1.诚实正直、稳重乐观、积极向上，有很好的上进心和自学能力；</p>
                        <p>2.对待工作有强烈的责任心，严谨认真、吃苦耐劳，具有很强的抗压能力；</p>
                        <p>3.具有很强的执行能力、沟通能力和团队精神，同时具备独立完成任务的能力；</p>
                        <p>4.逻辑思维能力强，对事物具有敏锐的观察力</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".close").click(function () {
                $(".alert").hide();
            });
            $(".add").click(function () {
                $(".alert").show();
            });
            $("[data-role='updatestate']").click(function () {
                var This = this;
                var State = Number($(this).attr("data-val"));
                var ID = $(this).attr("data-id");
                $.post("../../Handler/UpdateHrStateHandler.ashx", { State: State, ID: ID }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("操作成功!");
                        location.reload();
                        return;
                    }
                    alert(json.Message);
                    $(This).show();
                });
            });
        });

        function ShowDetail(data) {
            $(".alert").show();
            $(".alert data-role").text("");
            for (var i in data) {
                $("[data-role='" + i + "']").html(data[i]);
            }
            if ($.trim(data.OfflinePath).length > 0) {
                var path = $.trim(data.OfflinePath);
                $("[data-role='OfflinePath']").text("下载").prop("href", "<%=ConfigurationManager.AppSettings["FileUrl"]%>OfflineResum/" + path.substr(0, 4) + "/" + path.substr(4, 2) + "/" + path.substr(6, 2) + "/" + path);
            } else {
                $("[data-role='OfflinePath']").text("无离线简历").prop("href", "javascript:");
            }
        }

    </script>
</body>
</html>
