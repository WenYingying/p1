<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="EnterpriseManage_Financing_Default" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="Pager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style type="text/css">
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
                width: 24.5%;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }

            .bottom_list li a.tit {
                background-color: #006c9b;
            }

            .bottom_list li .tit_hide {
                top: 0rem;
                right: 18%;
                white-space: normal;
            }

                .bottom_list li .tit_hide > b {
                    top: 0.2rem;
                    left: -0.09rem;
                    transform: rotate(90deg);
                    -ms-transform: rotate(90deg);
                    -moz-transform: rotate(90deg);
                    -webkit-transform: rotate(90deg);
                    -o-transform: rotate(90deg);
                }

            .bottom_list li .edit {
                margin-right: 0;
            }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    融资管理
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="Add.aspx">申请融资</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom_list">
        <ul>
            <li>
                <div>融资规模/出让股份</div>
                <div>创建时间</div>
                <div>状态</div>
                <div>操作</div>
            </li>
            <asp:Repeater ID="rpList" runat="server">
                <ItemTemplate>
                    <li>
                        <div><%#Eval("Money") %>万元/<%#Eval("Stock") %></div>
                        <div><%#Eval("PostTime") %></div>
                        <div>
                            <%#Enum.Parse(typeof(StateTxt), Eval("State").ToString()) %>  
                        </div>
                        <div>
                            <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==1 %>'>
                                <a href="javascript:" class="edit" data-val="2">推荐</a>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==2 %>'>
                                <a href="javascript:" class="edit" data-val="1">取消推荐</a>
                            </asp:PlaceHolder>
                            <a href="Edit.aspx?ID=<%#Eval("ID") %>" onclick="return confirm('修改后需重新审核，确定吗?');" class="edit">编辑</a>
                            <a href="../../Finance/Detail.aspx?ID=<%#Eval("ID") %>&Action=Pre" class="edit">预览</a>
                            <a href="javascript:void(0)" class="delete" data-val="<%#Eval("ID") %>">删除</a>
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
            $("a[data-menu='Finance']").addClass("active");
            $(".delete[data-val]").click(function () {
                if (confirm("确定删除此信息吗?")) {
                    var item = $(this).parent().parent();
                    item.fadeOut(500);
                    $.post("../../Handler/DeleteFinancingHandler.ashx", { "ID": $(this).attr("data-val") }, function (res) {
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

