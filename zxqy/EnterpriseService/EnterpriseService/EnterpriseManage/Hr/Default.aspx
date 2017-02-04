<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="EnterpriseManage_Hr_Default" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="Pager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style type="text/css">
        .list .recruit_hide {
            display: block;
        }

        .head .end {
            width: 1.5rem;
        }

        .bottom_list li {
            padding: 0.1rem 0;
        }

            .bottom_list li:first-child {
                padding: 0;
            }

            .bottom_list li > div {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }

                .bottom_list li > div:last-child {
                    width: 22%;
                }

            .bottom_list li .edit {
                margin-right: 0;
            }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    招聘管理
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="Add.aspx">添加新职位</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom_list">
        <ul>
            <li>
                <div>职位名称</div>
                <div>部门</div>
                <div>职位发布状态</div>
                <div>招聘发布时间</div>
                <div>最后修改时间</div>
                <div>操作</div>
            </li>
            <asp:Repeater ID="rpList" runat="server">
                <ItemTemplate>
                    <li>
                        <div><%#Eval("PositionName") %> </div>
                        <div><%#Eval("Depart") %></div>
                        <div><%#Enum.Parse(typeof(StateTxt),Eval("State").ToString()) %></div>
                        <div><%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy/MM/dd") %></div>
                        <div><%#Convert.ToDateTime(Eval("LastUpdateTime")).ToString("yyyy/MM/dd") %></div>
                        <div>
                            <a href="Edit.aspx?ID=<%#Eval("ID") %>" class="edit">编辑</a>
                            <a href="Resum.aspx?HrId=<%#Eval("ID") %>" class="edit">简历</a>
                            <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==1 %>'>
                                <a href="javascript:void(0)" class="edit" data-role="updatestate" data-val="2" data-id="<%#Eval("ID") %>">推荐</a>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==2 %>'>
                                <a href="javascript:void(0)" class="edit" data-role="updatestate" data-val="1" data-id="<%#Eval("ID") %>">取消推荐</a>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))>0 %>'>
                                <a href="javascript:void(0)" style="width: 0.6rem;" class="delete" data-role="updatestate" data-val="0" data-id="<%#Eval("ID") %>">停止招聘</a>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==0 %>'>
                                <a href="javascript:void(0)" class="edit" data-role="updatestate" data-val="1" data-id="<%#Eval("ID") %>">再次发布</a>
                            </asp:PlaceHolder>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            <uc:Pager ID="pager" runat="server" />
        </ul>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("a[data-menu='Hr']").addClass("active");
            var funC = function (e) {
                var This = e.target;
                var parent = $(This).parent();
                $("a[data-role='updatestate']").remove();
                switch (Number($(This).attr("data-val"))) {
                    case 0:
                        $("<a href='javascript:' data-role='updatestate'>").appendTo(parent).addClass("edit").attr("data-id", $(This).attr("data-id")).attr("data-val", 1).text("再次发布").click(funC);
                        break;
                    case 1:
                        $("<a href='javascript:' data-role='updatestate'>").appendTo(parent).addClass("edit").attr("data-id", $(This).attr("data-id")).attr("data-val", 2).text("推荐").click(funC);
                        break;
                    case 2:
                        $("<a href='javascript:' data-role='updatestate'>").appendTo(parent).addClass("edit").attr("data-id", $(This).attr("data-id")).attr("data-val", 1).text("取消推荐").click(funC);
                        break;
                }
                $.post("../../Handler/UpdateHrStateHandler.ashx", { "ID": $(This).attr("data-id"), "State": $(This).attr("data-val") }, function (res) {
                    var json = JSON.parse(res);
                    if (!json.Result) {
                        alert(json.Message);
                        return;
                    }

                });
            };
            $("a[data-role='updatestate']").click(funC);
        });
    </script>
</asp:Content>

