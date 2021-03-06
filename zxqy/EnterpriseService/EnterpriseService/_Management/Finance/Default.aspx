﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Management_Finance_Default" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="pager" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>融资企业</title>
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
                    text-align: right;
                    margin-right: 0.05rem;
                    color: #959595;
                    font-size: 0.14rem;
                    display: inline-block;
                    text-indent:0.05rem;
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
            width: 7%;
            text-indent: 0.2rem;
        }

        .iframe_right .list li > div:nth-child(2) {
            width: 20%;
        }

        .iframe_right .list li > div:nth-child(3) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(4) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(5) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(6) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(7) {
            width: 11%;
        }

        .iframe_right .list li > div:nth-child(8) {
            width: 15%;
        }

        .alert_box div {
            width: 4.7rem;
        }

        .top, .no_top {
            width: 0.25rem;
            height: 0.25rem;
            line-height: 0.25rem;
            text-align: center;
            border-radius: 50%;
            color: #fff;
            font-size: 0.14rem;
            background-color: #f19149;
            display: inline-block;
        }

        .no_top {
            background-color: #e60012;
        }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2><%=int.Parse(Request.QueryString["State"])==0?"待审核融资":int.Parse(Request.QueryString["State"])==-1?"被驳回融资":"融资中列表" %></h2>
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
        <div class="list">
            <ul>
                <li>
                    <div>序列</div>
                    <div>企业名称</div>
                    <div>发布时间</div>
                    <div>融资金额</div>
                    <div>出让股权</div>
                    <div>状态</div>
                    <div>是否置顶</div>
                    <div>操作</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("CompanyName") %></div>
                            <div><%#Eval("PostTime") %></div>
                            <div><%#Eval("Money") %>万元</div>
                            <div><%#Eval("Stock") %></div>
                            <div><%#(StateTxt)Eval("State") %></div>
                            <div>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))<2 %>'>
                                    <a class="iconfont top" title="顶置信息" data-val="2" data-id="<%#Eval("ID") %>" data-role="updatestate">&#xe641;</a>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" Visible='<%#Convert.ToInt32(Eval("State"))==2 %>'>
                                    <a class="iconfont no_top" title="取消顶置" data-val="1" data-id="<%#Eval("ID") %>" data-role="updatestate">&#xe621;</a>
                                </asp:PlaceHolder>
                            </div>
                            <div>
                                <a href="Info.aspx?ID=<%#Eval("ID") %>" class="btns add">进入</a>
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
            $(".delete").click(function () {
                $(this).parents("div").parents("li").remove();
            });
            $("[data-role='updatestate']").click(function () {
                var This = this;
                var State = Number($(this).attr("data-val"));
                var ID = $(this).attr("data-id");
                $.post("../../Handler/UpdateFinancingStateHandler.ashx", { State: State, ID: ID }, function (res) {
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
