<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Management_ConferenceRoom_Default" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加会议室</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .iframe_right .list li > div:nth-child(1) {
            width: 10%;
            text-indent: 0.1rem;
        }

        .iframe_right .list li > div:nth-child(2) {
            width: 30%;
        }

        .iframe_right .list li > div:nth-child(3) {
            width: 30%;
        }

        .iframe_right .list li > div:nth-child(4) {
            width: 20%;
        }

        .alert_box div {
            width: 4.7rem;
        }

        .alert_box li > span {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title" style="position: relative;">
            <h2>会议室列表</h2>
            <a href="javascript:void(0)" class="btn post" style="position: absolute; right: 0.2rem; top: 0.08rem;">新增会议室</a>
        </div>
        <div class="list">
            <ul>
                <li>
                    <div>序列</div>
                    <div>会议室名称</div>
                    <div>会议室地址</div>
                    <div>操作</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("Name") %></div>
                            <div><%#Eval("Addr") %></div>
                            <div>
                                <a href="javascript:void(0)" class="btns edit" data-id="<%#Eval("ID") %>" data-val="<%#Eval("MarkUp") %>">编辑</a>
                                <a href="javascript:void(0)" class="btns delete" data-role='delete' data-id="<%#Eval("ID") %>">删除</a>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="alert add_alert">
        <div class="alert_head">
            <h2>添加</h2>
            <a href="javascript:void(0)" class="iconfont close">&#xe621;</a>
        </div>
        <div class="alert_box">
            <ul>
                <li>
                    <span>会议室名称</span>
                    <div>
                        <input type="text" name="" id="Name" value="" placeholder="请输入会议室名称，唯一标识会议室" />
                    </div>
                </li>
                <li>
                    <span>会议室地址</span>
                    <div>
                        <input type="text" name="" id="Addr" value="" placeholder="请输入会议室详细地址（门牌号）" />
                    </div>
                </li>
                <li>
                    <span style="vertical-align: top;">会议室备注</span>
                    <div>
                        <textarea name="" rows="" cols="" id="MarkUp" placeholder="如会议室可容纳人数，有何设备等" style="padding-left:0.1rem;"></textarea>
                    </div>
                </li>
                <li>
                    <span></span>
                    <div>
                        <a href="javascript:void(0)" class="btn" id="submitBtn">确认</a>
                        <a href="javascript:void(0)" class="btn" onclick="$('.close').click()">取消</a>
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
            $("[data-role='delete']").click(function () {
                if (confirm("确定删除此信息吗?")) {
                    var item = $(this).parent().parent();
                    item.fadeOut(500);
                    $.post("../../Handler/DeleteConferenceRoomHandler.ashx", { "ID": $(this).attr("data-id") }, function (res) {
                        var json = JSON.parse(res);
                        if (!json.Result) {
                            alert(json.Message);
                            item.show();
                            return;
                        }
                    });
                }
            });
            $(".post").click(function () {
                $(".add_alert").show();
                $("#Name").val("");
                $("#Addr").val("");
                $("#MarkUp").val("");
                $("#submitBtn").off().click(function () {
                    var Name = $.trim($("#Name").val());
                    var Addr = $.trim($("#Addr").val());
                    var MarkUp = $.trim($("#MarkUp").val());
                    if (Name.length == 0 || Addr.length == 0) {
                        alert("请输入会议室名称和地址")
                        return;
                    }
                    $.post("../../Handler/PostConferenceRoomHandler.ashx", { Name: escape(Name), Addr: escape(Addr), MarkUp: escape(MarkUp) }, function (res) {
                        var json = JSON.parse(res);
                        if (json.Result) {
                            location.reload();
                            return;
                        }
                        alert(json.Message);
                    });
                });
            });
            $(".edit").click(function () {
                $(".add_alert").show();
                $("#Name").val($(this).parent().siblings("div:eq(1)").text());
                $("#Addr").val($(this).parent().siblings("div:eq(2)").text());
                $("#MarkUp").val($(this).attr("data-val"));
                var ID = $(this).attr("data-id");
                $("#submitBtn").off().click(function () {
                    var Name = $.trim($("#Name").val());
                    var Addr = $.trim($("#Addr").val());
                    var MarkUp = $.trim($("#MarkUp").val());
                    if (Name.length == 0 || Addr.length == 0) {
                        alert("请输入会议室名称和地址")
                        return;
                    }
                    $.post("../../Handler/UpdateConferenceRoomHandler.ashx", { Name: escape(Name), Addr: escape(Addr), MarkUp: escape(MarkUp),ID:ID }, function (res) {
                        var json = JSON.parse(res);
                        if (json.Result) {
                            location.reload();
                            return;
                        }
                        alert(json.Message);
                    });
                });
            });

        });
    </script>
</body>
</html>
