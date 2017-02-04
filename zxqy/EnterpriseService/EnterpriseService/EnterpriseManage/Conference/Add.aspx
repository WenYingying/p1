<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="EnterpriseManage_Conference_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <link href="../../css/jquery.datetimepicker.css" rel="stylesheet" />
    <style>
        .head .end {
            width: 1.5rem;
        }

        .right .bottom li {
            width: 100%;
        }

            .right .bottom li > span {
                width: 8%;
            }

            .right .bottom li > input, .right .bottom li > select {
                width: 20%;
            }

            .right .bottom li > textarea {
                width: 46%;
                max-width: 46%;
            }

        .btn {
            display: inline-block;
            width: 10%;
            font-size: 0.14rem;
            border-radius: 0.02rem;
        }

        .content_center .right li::after {
            content: "发布新闻";
            opacity: 0;
        }

        .content_center li.null::after {
            content: attr(title);
            color: red;
            opacity: 1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    预约会议室
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="javascript:history.back(-1)">返回</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom">
        <ul>
            <li title="请选择一个会议室">
                <span>会议室</span>
                <select id="RoomId">
                    <option value="0" data-markup="选择一个会议室" data-addr="选择一个会议室">选择一个会议室</option>
                    <asp:Repeater ID="rpList" runat="server">
                        <ItemTemplate>
                            <option value="<%#Eval("ID") %>" data-markup="<%#Eval("MarkUp") %>" data-addr="<%#Eval("Addr") %>"><%#Eval("Name") %></option>
                        </ItemTemplate>
                    </asp:Repeater>
                </select>
                <b class="required">*</b>
            </li>
            <li>
                <span>会议室地址</span>
                <label id="addr">选择一个会议室</label>
            </li>
            <li>
                <span>会议备注</span>
                <label id="markup">选择一个会议室</label>
            </li>
            <li title="接受7天内预定，结束时间要晚于开始时间">
                <span>预定时间</span>
                <input type="text" name="" id="StartTime" value="" />
                ——— 
                <input type="text" name="" id="EndTime" value="" />
                <b class="required">*</b>
            </li>
            <li>
                <span>额外要求</span>
                <textarea placeholder="对会议室的特殊要求说明" id="MarkUp"></textarea>
            </li>
            <li>
                <span></span>
                <a href="javascript:void(0)" class="btn" id="submitBtn">立即预约</a>
                <a href="javascript:history.back(-1)" class="btn" style="background-color: #d0d0d0; color: #a40000;">返回</a>
            </li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
    <script src="../../js/jquery.datetimepicker.full.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a[data-menu='Meeting']").addClass("active");
            $("#RoomId").change(function () {
                $("#addr").text($(this).children("option:selected").attr("data-addr"));
                $("#markup").text($(this).children("option:selected").attr("data-markup"));
            });
            Date.prototype.dateAdd = function (interval, number) {
                var d = this;
                var k = { 'y': 'FullYear', 'q': 'Month', 'm': 'Month', 'w': 'Date', 'd': 'Date', 'h': 'Hours', 'n': 'Minutes', 's': 'Seconds', 'ms': 'MilliSeconds' };
                var n = { 'q': 3, 'w': 7 };
                eval('d.set' + k[interval] + '(d.get' + k[interval] + '()+' + ((n[interval] || 1) * number) + ')');
                return d;
            }
            var minDate = new Date();
            var maxDate = (new Date()).dateAdd('d', 7);
            $("#StartTime,#EndTime").datetimepicker({
                dayOfWeekStart: 1,
                minDate: minDate,
                maxDate: maxDate,
                startDate: minDate
            });
            $(".required").siblings("input[id!='xhe0_fixffcursor'],select").blur(function () {
                if ($.trim($(this).val()).length == 0 || $.trim($(this).val()) == "0") {
                    $(this).parent().addClass("null");
                    return;
                }
                $(this).parent().removeClass("null");
            });

            var postFunc = function (e) {
                $(".required").not(":hidden").siblings("input,select").blur();
                if ($.trim($("#EndTime").val()) < $.trim($("#StartTime").val()) || $.trim($("#EndTime").val()) == $.trim($("#StartTime").val())) {
                    $("#EndTime").parent().addClass("null");
                }
                if ($(".null").length > 0) {
                    $(".content").scrollTop($(".content").scrollTop() + $("li:not(:hidden).null:eq(0)").offset().top - 60);
                    return;
                }

                $(e.target).off().text("数据提交中...");
                var data = { RoomId: $.trim($("#RoomId").val()), StartTime: $.trim($("#StartTime").val()), EndTime: $.trim($("#EndTime").val()), MarkUp: escape($.trim($("#MarkUp").val())), "UserId": "<%=((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.ID%>", "AdminId": "0", "EnterpriseId": "<%=((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.EnterpriseId%>" };
                $.post("../../Handler/PostOrderConferenceRoomHandler.ashx", data, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("会议室申请发送成功！");
                        location.href = "Default.aspx";
                        return;
                    }
                    $(e.target).off().click(postFunc).text("保存");
                    alert(json.Message);
                });
            };

            $("#submitBtn").off().click(postFunc);
        });
    </script>
</asp:Content>

