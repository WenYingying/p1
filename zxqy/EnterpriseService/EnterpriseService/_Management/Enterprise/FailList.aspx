<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FailList.aspx.cs" Inherits="_Management_Enterprise_FailList" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="pager" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>驳回企业</title>
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
                    text-indent: 0.05rem;
                }

                .list_top li > div {
                    display: inline-block;
                }

                .list_top li:first-child > div {
                    width: 2rem;
                }

                .list_top li > div > input {
                    width: 2rem;
                    height: 0.3rem;
                    line-height: 0.3rem;
                    border: 1px solid #dcdcdc;
                    text-indent: 0.1rem;
                    background-color: #fff;
                }

        .iframe_right .list li > div:nth-child(1) {
            width: 10%;
            text-indent: 0.2rem;
        }

        .iframe_right .list li > div:nth-child(2) {
            width: 20%;
        }

        .iframe_right .list li > div:nth-child(3) {
            width: 12%;
        }

        .iframe_right .list li > div:nth-child(4) {
            width: 10%;
        }

        .iframe_right .list li > div:nth-child(5) {
            width: 10%;
        }

        .iframe_right .list li > div:nth-child(6) {
            width: 15%;
        }

        .iframe_right .list li > div:nth-child(7) {
            width: 20%;
        }

        .alert_box div {
            width: 4.7rem;
        }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2>驳回入住企业</h2>
        </div>
        <div class="list_top">
            <ul>
                <li>
                    <span>企业/项目名称</span>
                    <div>
                        <input type="text" name="" id="Key" value="<%=!string.IsNullOrEmpty(Request.QueryString["Key"])?Server.UrlDecode(Request.QueryString["Key"].Trim()):string.Empty %>" placeholder="请输入企业或项目名称" />
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
                    <a href="javascript:void(0)" class="btn" onclick="if($.trim($('#Key').val()).length==0){alert('请输入企业或项目名称');return;} location.href='?Key='+escape($.trim($('#Key').val()))">查找企业</a>
                </li>
            </ul>
        </div>

        <div class="list">
            <ul>
                <li>
                    <div>序列</div>
                    <div>企业/项目名称</div>
                    <div>申请时间</div>
                    <div>入住类型</div>
                    <div>申请人</div>
                    <div>手机号码</div>
                    <div>驳回详情</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("CompanyName").ToString().Trim()=="NULL"?Eval("ProjectName"):Eval("CompanyName") %></div>
                            <div><%#Eval("PostTime") %></div>
                            <div><%#Eval("CompanyName").ToString().Trim()=="NULL"?"项目":"企业" %></div>
                            <div>
                                <asp:Literal runat="server" ID="liName"></asp:Literal>
                            </div>
                            <div>
                                <asp:Literal runat="server" ID="liMobile"></asp:Literal>
                            </div>
                            <div>
                                <a href="EnterpriseInfo.aspx?ID=<%#Eval("ID") %>" class="btns add">查看</a>
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
        });
    </script>
</body>
</html>
