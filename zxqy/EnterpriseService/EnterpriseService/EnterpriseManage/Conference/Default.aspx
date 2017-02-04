<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="EnterpriseManage_Conference_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style>
        .head .end {
            width: 1.5rem;
        }

        .bottom_list li > div:first-child, .bottom_list li > div:nth-child(4) {
            width: 21%;
        }

        .bottom_list li > div:nth-child(5), .bottom_list li > div:nth-child(6) {
            width: 12%;
        }

        .bottom_list li a.tit {
            background-color: #006c9b;
        }

        .bottom_list li .cancel {
            width: 0.8rem;
            height: 0.25rem;
            line-height: 0.25rem;
            text-align: center;
            background-color: #bfbfbf;
            font-size: 0.12rem;
            color: #fff;
            border-radius: 0.02rem;
            display: inline-block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    预约会议室管理
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="Add.aspx">立即预约</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom_list">
        <ul>
            <li>
                <div>会议室名称</div>
                <div>使用时间</div>
                <div>结束时间</div>
                <div>会议室地址</div>
                <div>状态</div>
                <div>操作</div>
            </li>
            <asp:Repeater ID="rpList" runat="server">
                <ItemTemplate>
                    <li>
                        <div><%#Eval("RoomName") %></div>
                        <div><%#Common.GetInstance.FormatDate(Convert.ToDateTime(Eval("StartTime")),"yyyy/MM/dd HH:mm") %></div>
                        <div><%#Common.GetInstance.FormatDate(Convert.ToDateTime(Eval("EndTime")),"yyyy/MM/dd HH:mm") %></div>
                        <div><%#Eval("Addr") %></div>
                        <div title="<%#Eval("Reason") %>">
                            <%#(StateTxt)Eval("State") %>
                        </div>
                        <div>
                            <a href="javascript:void(0)" class="delete" data-val="<%#Eval("ID") %>" style="width:0.8rem;"><%#Convert.ToInt32(Eval("State"))==0?"取消预订":"删除记录" %></a>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("a[data-menu='Meeting']").addClass("active");
            $(".content_center li .tit").click(function () {
                $(this).siblings(".tit_hide").toggleClass("tipshow");
            });
            $(".delete[data-val]").click(function () {
                if (confirm("确定取消会议室预订吗?")) {
                    var item = $(this).parent().parent();
                    item.fadeOut(500);
                    $.post("../../Handler/DeleteOrderConferenceRoomHandler.ashx", { "ID": $(this).attr("data-val") }, function (res) {
                        var json = JSON.parse(res);
                        if (!json.Result) {
                            alert(json.Message);
                            item.show();
                            return;
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>

