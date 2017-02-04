<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Management_Enterprise_Default" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="pager" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>已签订协议进行上传营业执照</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
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
            <h2>审核入住企业</h2>
        </div>
        <div class="list_head">
            <ul>
                <li>
                    <a href="Default.aspx?State=0" <%=Request.QueryString["State"]=="0"?"class='active'":string.Empty %>><strong style="font-size:0.2rem;">1</strong>待审核企业</a>
                    <span>|</span>
                </li>
                <li>
                    <a href="Default.aspx?State=1" <%=Request.QueryString["State"]=="1"?"class='active'":string.Empty %>><strong style="font-size:0.2rem;">2</strong>待签订协议企业</a>
                    <span>|</span>
                </li>
                <li>
                    <a href="Default.aspx?State=2" <%=Request.QueryString["State"]=="2"?"class='active'":string.Empty %>><strong style="font-size:0.2rem;">3</strong>待审核营业执照企业</a>
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
                    <div>操作</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("CompanyName").ToString().Trim()=="NULL"?Eval("ProjectName"):Eval("CompanyName") %></div>
                            <div><%#Eval("PostTime") %></div>
                            <div><%#Eval("CompanyName").ToString().Trim()=="NULL"?"项目":"企业" %></div>
                            <div>
                                <asp:Literal runat="server" ID="liName"></asp:Literal></div>
                            <div>
                                <asp:Literal runat="server" ID="liMobile"></asp:Literal></div>
                            <div>
                                <a href="EnterpriseInfo.aspx?ID=<%#Eval("ID") %>" class="btns add">查看</a>
                                <a href="javascript:void(0)" data-val="<%#Convert.ToInt32(Eval("State"))<0?0:Convert.ToInt32(Eval("State"))+1%>" class="btns" data-id="<%#Eval("ID") %>" data-role="updatestate">通过</a>
                                <a href="javascript:void(0)" class="btns" data-val="<%#Convert.ToInt32(Eval("State"))>0?0-(Convert.ToInt32(Eval("State"))+1):-1 %>" data-id="<%#Eval("ID") %>" data-role="updatestate">驳回</a>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <uc:pager ID="pager" runat="server" />
        </div>
    </div>
    <%--    <div class="alert add_alert">
        <div class="alert_head">
            <h2>企业信息</h2>
            <a href="javascript:void(0)" class="iconfont close">&#xe621;</a>
        </div>
        <div class="alert_box">
            <ul>
                <li>
                    <span>入驻类型</span>
                    <div data-tag="Type">企业入驻</div>
                </li>
                <li data-role="company">
                    <span>企业名称</span>
                    <div data-tag="CompanyName">北京江河科技有限公司</div>
                </li>
                <li>
                    <span>项目名称</span>
                    <div data-tag="ProjectName">北京江河科技有限公司</div>
                </li>
                <li data-role="company">
                    <span>法人代表</span>
                    <div data-tag="LegalPerson">海洋</div>
                </li>
                <li data-role="company">
                    <span>注册固定电话</span>
                    <div data-tag="Tel">010-40000000</div>
                </li>
                <li data-role="company">
                    <span>统一社会信用代码</span>
                    <div data-tag="LicenseCode">123456789012345678</div>
                </li>
                <li data-role="company">
                    <span>注册固定地址</span>
                    <div data-tag="RegisterAddr">北京市朝阳区分钟寺四道口</div>
                </li>
                <li data-role="company">
                    <span>营业执照</span>
                    <div data-tag="LicensePic"><a href="javascript:void(0)" class="download">查看</a></div>
                </li>
                <li>
                    <span>上传企划书附件</span>
                    <div data-tag="ProjectPlan"><a href="javascript:void(0)" class="download">下载</a></div>
                </li>
                <li class="last">
                    <span>公司介绍</span>
                    <div data-tag="CompanyIntr">中国第一家创业服务运营品牌。创业集团旨在为创业者提供优质灵活的创新空间，让每一个选择创业集团的团队都能享受到堪比谷歌、微软的办公氛围。在这里，它不仅仅是办公室，它也是咖啡厅，让创业者“足不出户”便可享受休闲时光，可以喝着咖啡与其他创业者交流，让激烈的思想碰撞带给创业者创业新思路；在这里，创业者可以把它看成一所学校，通过集聚了优秀的创业培训导师和实战企业家，开设创业公开课，全天候为创业者进行服务和指导，为创业者指明创业方向；同样，它也是融资平台，创业集团通过把创业者的思路推荐给投资人，让创业者在创业路中获得一笔丰厚的启动资金。创新空间还为创业者提供了人力招聘、财务管理、物业管理、法务咨询等一</div>
                </li>
                <li class="last">
                    <span>项目介绍</span>
                    <div data-tag="ProjectIntr">中国第一家创业服务运营品牌。创业集团旨在为创业者提供优质灵活的创新空间，让每一个选择创业集团的团队都能享受到堪比谷歌、微软的办公氛围。在这里，它不仅仅是办公室，它也是咖啡厅，让创业者“足不出户”便可享受休闲时光，可以喝着咖啡与其他创业者交流，让激烈的思想碰撞带给创业者创业新思路；在这里，创业者可以把它看成一所学校，通过集聚了优秀的创业培训导师和实战企业家，开设创业公开课，全天候为创业者进行服务和指导，为创业者指明创业方向；同样，它也是融资平台，创业集团通过把创业者的思路推荐给投资人，让创业者在创业路中获得一笔丰厚的启动资金。创新空间还为创业者提供了人力招聘、财务管理、物业管理、法务咨询等一</div>
                </li>
                <li>
                    <span></span>
                    <div>
                        <a href="javascript:void(0)" class="btn">营业执照通过，入驻园区</a>
                        <a href="javascript:void(0)" class="btn">驳回，让企业重新上传</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>--%>
    <div class="alert reject_alert">
        <div class="alert_head">
            <h2>驳回</h2>
            <a href="javascript:void(0)" class="iconfont close">&#xe621;</a>
        </div>
        <div class="alert_box">
            <ul>
                <li>
                    <span>驳回原因</span>
                    <div>
                        <textarea id="Remark" placeholder="说明被驳回的原因"></textarea>
                    </div>
                </li>
                <li>
                    <span></span>
                    <div>
                        <a href="javascript:void(0)" class="btn" id="submitBtn">确认</a>
                        <a href="javascript:void(0)" class="btn" onclick="$('.close').click();">取消</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".close").click(function () {
                $(".alert").hide();
            });

            //$(".add").click(function () {
            //    $(".add_alert").show();
            //});

            $("[data-role='updatestate']").click(function () {
                var State = Number($(this).attr("data-val"));
                var ID = $(this).attr("data-id");
                if (State < 0) {
                    $(".reject_alert").show();
                    $("#Remark").val("");
                    switch (State) {
                        case -1:
                            $("#Remark").attr("placeholder", "请输入评审失败的说明，以便企业进行相应的修改和调整");
                            break;
                        case -2:
                            $("#Remark").attr("placeholder", "协议签订失败的说明");
                            break;
                        case -3:
                            $("#Remark").val("工商手续不符合入园标准");
                            break;
                    }
                    $("#submitBtn").off().click(function () {
                        var Remark = $.trim($("#Remark").val());
                        if (Remark.length == 0) {
                            alert("请输入驳回原因");
                            return;
                        }
                        $.post("../../Handler/UpdateEnterpriseStateHandler.ashx", { ID: ID, State: State, Remark: escape(Remark) }, function (res) {
                            var json = JSON.parse(res);
                            if (json.Result) {
                                location.href = "FailList.aspx";
                                return;
                            }
                            alert(json.Message);
                        });
                    });
                    return;
                }
                $.post("../../Handler/UpdateEnterpriseStateHandler.ashx", { ID: ID, State: State, Remark: "" }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        if (State < 3)
                            location.href = "Default.aspx?State=" + State;
                        else
                            location.href = "SuccessList.aspx";
                        return;
                    }
                    alert(json.Message);
                });

            });
        });
		</script>
</body>
</html>
