<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequestList.aspx.cs" Inherits="_Management_ConferenceRoom_RequestList" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="pager" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>审核预约管理</title>
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

        .iframe_right .list li > div:nth-child(1) {
            width: 5%;
            text-indent: 0.1rem;
        }

        .iframe_right .list li > div:nth-child(2) {
            width: 20%;
        }

        .iframe_right .list li > div:nth-child(3) {
            width: 20%;
        }

        .iframe_right .list li > div:nth-child(4) {
            width: 8%;
        }

        .iframe_right .list li > div:nth-child(5) {
            width: 12%;
        }

        .iframe_right .list li > div:nth-child(6) {
            width: 12%;
        }

        .iframe_right .list li > div:nth-child(7) {
            width: 20%;
        }

        .alert_box div {
            width: 4.7rem;
        }

        .list_top {
            height: auto;
            line-height: 0;
            padding: 0.2rem 0;
        }

            .list_top li.state > span {
                width: 1.35rem;
            }

            .list_top li {
                margin-bottom: 0.2rem;
            }

        .btn {
            padding: 0.15rem 0.18rem;
        }

        .btn1 {
            background-color: #ff6666;
        }

        .btn2 {
            background-color: #ffc266;
        }

        .btn3 {
            background-color: #d2d2d2;
        }

        .list_top li.time {
            width: 96%;
            height: 0.6rem;
            margin: 0 auto;
            background-color: #fff;
            overflow: hidden;
            display: block;
            border: 1px solid #7d7d7d;
        }

        .list_top li.firm {
            width: 96%;
            height: 0.7rem;
            margin: 0 auto;
            background-color: #fff;
            overflow: hidden;
            display: block;
            border: 1px solid #7d7d7d;
            border-top: 0;
        }

        .time > div {
            width: 9.6%;
            height: 0.6rem;
            line-height: 0.25rem;
            padding-top: 0.1rem;
            text-align: center;
            border-right: 1px solid #7d7d7d;
        }

            .time > div:last-child {
                border-right: 0;
            }

            .time > div > span {
                display: block;
            }

        .list_top li.firm > a {
            min-width: 9.6%;
            height: 0.7rem;
            line-height: 0.7rem;
            border-right: 1px solid #7d7d7d;
            text-align: center;
            margin-left: -0.04rem;
            display: inline-block;
            vertical-align: top;
            background-color: #d2d2d2;
        }

            .list_top li.firm > a.use {
                background-color: #ff6666;
            }

            .list_top li.firm > a.reserve {
                background-color: #ffc266;
            }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2>会议室预约管理</h2>
        </div>
        <div class="list">
            <ul>
                <li>
                    <div>序列</div>
                    <div>申请企业</div>
                    <div>会议室名称</div>
                    <div>状态</div>
                    <div>开始时间</div>
                    <div>结束时间</div>
                    <div>操作</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("CompanyName") %></div>
                            <div><%#Eval("RoomName") %></div>
                            <div><%#(StateTxt)Eval("State") %></div>
                            <div><%#Eval("StartTime") %></div>
                            <div><%#Eval("EndTime") %></div>
                            <div>
                                <input type="hidden" value="<%#Eval("MarkUp") %>" />
                                <input type="hidden" value="<%#Eval("Reason") %>" />
                                <a href="javascript:void(0)" class="btns add" data-state="<%#Eval("State") %>" data-id="<%#Eval("id") %>">查看</a>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==-1 %>'>
                                    <a href="javascript:void(0)" class="btns" data-id="<%#Eval("id") %>" data-role="delete">删除</a>
                                </asp:PlaceHolder>
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
            <h2>会议室预订信息</h2>
            <a href="javascript:void(0)" class="iconfont close">&#xe621;</a>
        </div>
        <div class="alert_box">
            <ul>
                <li>
                    <span>会议室名称</span>
                    <div id="RoomName"></div>
                </li>
                <li>
                    <span>申请企业</span>
                    <div id="CompanyName"></div>
                </li>
                <li>
                    <span>状　　态</span>
                    <div id="State"></div>
                </li>
                <li>
                    <span>预定时间</span>
                    <div id="StartTime"></div>
                </li>
                <li>
                    <span>结束时间</span>
                    <div id="EndTime"></div>
                </li>
                <li>
                    <span>备　　注</span>
                    <div id="Markup"></div>
                </li>
                <li id="liReason" style="display: none;">
                    <span>驳回原因</span>
                    <div></div>
                </li>
                <li id="Reason" style="display: none;">
                    <span>驳回原因</span>
                    <div>
                        <textarea name="" rows="" cols="" placeholder="请输入驳回原因" style="height: 1rem;"></textarea>
                    </div>
                </li>
                <li>
                    <span></span>
                    <div>
                        <a href="javascript:void(0)" class="btn" data-role="updatestate" data-val="1">通过</a>
                        <a href="javascript:void(0)" class="btn" data-role="updatestate" data-val="-1">驳回</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[data-role='delete']").click(function () {
                if (confirm("确定删除会议室预订吗?")) {
                    var item = $(this).parent().parent();
                    item.fadeOut(500);
                    $.post("../../Handler/DeleteOrderConferenceRoomHandler.ashx", { "ID": $(this).attr("data-id") }, function (res) {
                        var json = JSON.parse(res);
                        if (!json.Result) {
                            alert(json.Message);
                            item.show();
                            return;
                        }
                    });
                }
            });
            $(".close").click(function () {
                $(".alert").hide();
            });
            $(".add").click(function () {
                $(".add_alert").show();
                $("#RoomName").text($(this).parent().siblings("div:eq(2)").text());
                $("#CompanyName").text($(this).parent().siblings("div:eq(1)").text());
                $("#State").text($(this).parent().siblings("div:eq(3)").text());
                $("#StartTime").text($(this).parent().siblings("div:eq(4)").text());
                $("#EndTime").text($(this).parent().siblings("div:eq(5)").text());
                $("#Markup").text($(this).siblings("input:eq(0)").val());
                $("[data-role='updatestate']").attr("data-id", $(this).attr("data-id")).show();
                $("#liReason").hide();
                $("#Reason").hide();
                if ($(this).attr("data-state") != 0) {
                    $("[data-role='updatestate']").hide();
                }
                if ($(this).attr("data-state") == -1) {
                    $("#liReason").show();
                    $("#liReason div").text($(this).siblings("input:eq(1)").val());
                }
                $("[data-role='updatestate']").off().click(function () {
                    var ID = $(this).attr("data-id");
                    var State = $(this).attr("data-val");
                    if (State < 0) {
                        $("#Reason").show();
                        $("#Reason textarea").focus();
                        $(".alert_box").scrollTop($(".alert_box")[0].scrollHeight);
                        //$(this).siblings("a").hide();
                        $(this).off().click(function () {
                            var Reason = $.trim($("#Reason textarea").val());
                            if (Reason.length == 0) {
                                alert("请输入原因");
                                return;
                            }
                            postFunc(ID, State, Reason);
                        });
                        return;
                    }
                    postFunc(ID, State, Reason);
                });
            });


            var postFunc = function (ID, State, Reason) {
                $.post("../../Handler/UpdateOrderConferenceRoomStateHandler.ashx", { ID: ID, State: State, Reason: escape(Reason) }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        location.reload();
                        return;
                    }
                    alert(json.Message);
                });
            };
        });
    </script>
</body>
</html>
