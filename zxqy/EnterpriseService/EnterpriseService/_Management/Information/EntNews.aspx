<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntNews.aspx.cs" Inherits="_Management_Information_EntNews" %>

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
            width: 20%;
        }

        .iframe_right .list li > div:nth-child(3) {
            width: 20%;
        }

        .iframe_right .list li > div:nth-child(4) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(5) {
            width: 12%;
        }

        .iframe_right .list li > div:nth-child(6) {
            width: 25%;
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
        <div class="title">
            <h2>企业新闻</h2>
        </div>
        <div class="list_top">
            <ul>
                <li>
                    <span>企业名称</span>
                    <div>
                        <input type="text" name="" id="Key" value="<%=!string.IsNullOrEmpty(Request.QueryString["Key"])?Server.UrlDecode(Request.QueryString["Key"].Trim()):string.Empty %>" placeholder="请输入企业名称" />
                    </div>
                </li>
<%--                <li>
                    <span>申请时间</span>
                    <div>
                        <input type="date" name="" id="" value="" placeholder="请输入创建时间" />
                        <span>~</span>
                        <input type="date" name="" id="" value="" placeholder="请输入创建时间" />
                    </div>
                </li>--%>
                <li>
                    <a href="javascript:void(0)" class="btn" onclick="if($.trim($('#Key').val()).length==0){alert('请输入企业或名称');return;} location.href='?State=<%=Request.QueryString["State"] %>&Key='+escape($.trim($('#Key').val()))">查找企业</a>
                </li>
            </ul>
        </div>
        <div class="list_head">
            <ul>
                <li>
                    <a href="EntNews.aspx?State=0" <%=Request.QueryString["State"]=="0"?"class='active'":string.Empty %>><strong style="font-size: 0.2rem;">1</strong>待审核</a>
                    <span>|</span>
                </li>
                <li>
                    <a href="EntNews.aspx?State=1" <%=Request.QueryString["State"]=="1"?"class='active'":string.Empty %>><strong style="font-size: 0.2rem;">2</strong>发布中</a>
                    <span>|</span>
                </li>
                <li>
                    <a href="EntNews.aspx?State=-1" <%=Request.QueryString["State"]=="-1"?"class='active'":string.Empty %>><strong style="font-size: 0.2rem;">3</strong>未通过</a>
                </li>
            </ul>
        </div>
        <div class="list">
            <ul>
                <li>
                    <div>序列</div>
                    <div>标题</div>
                    <div>所属企业</div>
                    <div>状态</div>
                    <div>发布时间</div>
                    <div>操作</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("Title") %></div>
                            <div><%#Eval("CompanyName") %></div>
                            <div><%#(StateTxt)Eval("State") %></div>
                            <div><%#Eval("PostTime") %></div>
                            <div>
                                <a href="../../Information/Detail.aspx?ID=<%#Eval("ID") %>&Action=Pre" class="btns" target="_blank">预览</a>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==0 %>'>
                                    <a href="javascript:void(0)" class="btns" data-val="1" data-id="<%#Eval("ID") %>" data-role="updatestate">通过</a>
                                    <a href="javascript:void(0)" class="btns" data-val="-1" data-id="<%#Eval("ID") %>" data-role="updatestate">失败</a>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==-1 %>'>
                                    <a href="javascript:void(0)" class="btns" data-role="delete" data-id="<%#Eval("ID") %>">删除</a>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==1 %>'>
                                    <a href="javascript:void(0)" class="btns" data-val="3" data-id="<%#Eval("ID") %>" data-role="updatestate">推荐</a>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==3 %>'>
                                    <a href="javascript:void(0)" class="btns" data-val="1" data-id="<%#Eval("ID") %>" data-role="updatestate">取消推荐</a>
                                </asp:PlaceHolder>
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
                if (confirm("确定删除此新闻吗?")) {
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
