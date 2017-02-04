<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="EnterpriseManage_User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
    企业用户管理
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style>
        .head .end {
            width: 1.5rem;
        }

        .bottom_list li > div {
            width: 19.5%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    用户管理
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="Add.aspx">添加用户</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom_list">
        <ul>
            <li>
                <div>姓名</div>
                <div>职位</div>
                <div>手机号码</div>
                <div>建立时间</div>
                <div>操作</div>
            </li>
            <asp:Repeater ID="rpList" runat="server">
                <ItemTemplate>
                    <li>
                        <div><%#Eval("Name") %></div>
                        <div><%#Eval("Post") %></div>
                        <div><%#Eval("Mobile") %></div>
                        <div><%#Eval("CreateTime") %></div>
                        <div>
                            <a href="Edit.aspx?ID=<%#Eval("ID") %>" class="edit">编辑</a>
                            <a href="javascript:void(0)" class="delete" data-val="<%#Eval("ID") %>">删除</a>
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
            $("a[data-menu='User']").addClass("active");
            $(".delete[data-val]").click(function () {
                if (confirm("确定删除此用户吗?")) {
                    var item = $(this).parent().parent();
                    item.fadeOut(500);
                    $.post("../../Handler/DeleteEntUserHandler.ashx", { "ID": $(this).attr("data-val") }, function (res) {
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

