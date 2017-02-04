<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="EnterpriseManage_News_Default" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="Pager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">新闻管理</asp:Content>
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

            .bottom_list li .delete {
                width: 0.39rem;
                height: 0.22rem;
                line-height: 0.22rem;
                color: #fff;
                text-align: center;
                font-size: 0.12rem;
                border-radius: 0.02rem;
                display: inline-block;
                background-color: #bfbfbf;
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
                .bottom_list li .edit{
                    margin-right:0;
                }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    新闻管理
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="Add.aspx">添加新闻</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom_list">
        <ul>
            <li>
                <div style="width:3.8rem;">标题</div>
                <div style="width:1.9rem;">创建时间</div>
                <div style="width:1.6rem;">状态</div>
                <div style="width:1.9rem;">操作</div>
            </li>
            <asp:Repeater ID="rpList" runat="server">
                <ItemTemplate>
                    <li>
                        <div style="width:3.8rem;"><%#Eval("Title") %></div>
                        <div style="width:1.9rem;"><%#Eval("PostTime") %></div>
                        <div style="width:1.6rem;" title="<%#Enum.Parse(typeof(StateDes), Eval("State").ToString()) %>">
                            <%#Enum.Parse(typeof(StateTxt), Eval("State").ToString()) %>
                        </div>
                        <div style="width:1.9rem;">
                            <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==1 %>'>
                                <a href="javascript:" class="edit" data-val="2">推荐</a>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==2 %>'>
                                <a href="javascript:" class="edit" data-val="1">取消推荐</a>
                            </asp:PlaceHolder>
                            <a href="Edit.aspx?ID=<%#Eval("ID") %>" onclick="return confirm('修改新闻后需重新审核，确定吗?');" class="edit">编辑</a>
                            <a href="../../Information/Detail.aspx?ID=<%#Eval("ID") %>&Action=Pre" class="edit" target="_blank">预览</a>
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
            $("a[data-menu='News']").addClass("active");
            $(".content_center li .tit").click(function () {
                $(this).siblings(".tip").toggleClass("tipshow");
            });
            $(".content_center li .tit").click(function () {
                $(this).siblings(".tit_hide").toggleClass("tipshow");
            });

            $(".delete[data-val]").click(function () {
                if (confirm("确定删除此新闻吗?"))
                {
                    var item = $(this).parent().parent();
                    item.fadeOut(500);
                    $.post("../../Handler/DeleteInformationHandler.ashx", { "ID": $(this).attr("data-val") }, function (res) {
                        var json = JSON.parse(res);
                        if (!json.Result)
                        {
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

