<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Management_Information_Default" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="pager" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>未审核</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .list_top {
            width: 100%;
            height: 0.6rem;
            line-height: 0.6rem;
            background-color: #f5f5f5;
            margin-bottom: 0.2rem;
        }

            .list_top li {
                display: inline-block;
                width:100%;
                text-align:right;
            }



        .iframe_right .list li > div:nth-child(1) {
            width: 10%;
            text-indent: 0.2rem;
        }

        .iframe_right .list li > div:nth-child(2) {
            width: 30%;
        }

        .iframe_right .list li > div:nth-child(3) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(4) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(5) {
            width: 36%;
        }


        .alert_box div {
            width: 4.7rem;
        }

            .alert_box div.logo {
                width: 0.62rem;
                height: 0.62rem;
                display: inline-block;
                overflow: hidden;
            }

                .alert_box div.logo > img {
                    width: 100%;
                    height: 100%;
                    display: block;
                }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title" style="position:relative;">
            <h2><%=Common.GetInstance.GetInfoType(Request.QueryString["Type"]) %></h2>
            <a href="Add.aspx?Type=<%=Request.QueryString["Type"] %>" class="btn" style="position: absolute; right: 0.2rem; top: 0.08rem;">发布<%=Common.GetInstance.GetInfoType(Request.QueryString["Type"]) %></a>
        </div>
        <div class="list">
            <ul>
                <li>
                    <div>序列</div>
                    <div>标题</div>
                    <div>状态</div>
                    <div>发布时间</div>
                    <div>操作</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("Title") %></div>
                            <div><%#(StateTxt)Eval("State") %></div>
                            <div><%#Eval("PostTime") %></div>
                            <div>
                                <a href="../../Information/Detail.aspx?ID=<%#Eval("ID") %>&Action=Pre" class="btns" target="_blank">预览</a>
                                    <a href="Edit.aspx?ID=<%#Eval("ID") %>" class="btns">编辑</a>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==1 %>'>
                                    <a href="javascript:void(0)" class="btns" data-val="3" data-id="<%#Eval("ID") %>" data-role="updatestate">推荐</a>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==3 %>'>
                                    <a href="javascript:void(0)" class="btns" data-val="1" data-id="<%#Eval("ID") %>" data-role="updatestate">取消推荐</a>
                                </asp:PlaceHolder>
                                    <a href="javascript:void(0)" class="btns" data-role="delete" data-id="<%#Eval("ID") %>">删除</a>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <uc:pager ID="pager" runat="server" />
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[data-role='delete']").click(function () {
                if (confirm("确定删除此信息吗?")) {
                    var item = $(this).parent().parent();
                    item.fadeOut(500);
                    $.post("../../Handler/DeleteInformationHandler.ashx", { "ID": $(this).attr("data-id") }, function (res) {
                        var json = JSON.parse(res);
                        if (!json.Result) {
                            alert(json.Message);
                            item.show();
                            return;
                        }
                    });
                }
            });
            //UpdateInformationStateHandler
            $("[data-role='updatestate']").click(function () {
                var This = this;
                var State = Number($(this).attr("data-val"));
                var ID = $(this).attr("data-id");
                $.post("../../Handler/UpdateInformationStateHandler.ashx", { State: State, ID: ID }, function (res) {
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
	</script>
</body>
</html>
