<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EnterpriseInfo.aspx.cs" Inherits="_Management_Enterprise_EnterpriseInfo" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>企业详情</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        body {
            overflow-y: auto;
        }

        .btn_box {
            width: 100%;
            text-align: center;
        }

        .logo img {
            width: 0.6rem;
            height: 0.6rem;
        }

        .enter_info span {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2>企业申请审核</h2>
            <a href="javascript:history.back(-1)" class="add">返回</a>
        </div>
        <div class="enter_info" style="margin-bottom: 0;">
            <ul>
                <li>
                    <span>申请人姓名</span>
                    <div><%=user.Name %></div>
                </li>
                <li>
                    <span>账户/申请人手机</span>
                    <div><%=user.Mobile %></div>
                </li>
                <li class="last">
                    <span>企业状态</span>
                    <div><%=(StateTxt)ent.State %></div>
                </li>
                <%if(ent.State<0) { %>
                <li class="last">
                    <span>驳回原因</span>
                    <div>
                        <%=ent.Remark.Replace("\n","<br />") %>
                    </div>
                </li>
                <%} %>
            </ul>
        </div>
        <div style="text-align: center; background: #fff; height: 0.3rem;" class="enter_info">
            <%if (ent.State > -1 && ent.State < 3)
                { %>
            <a href="javascript:void(0)" class="btn" data-val="<%=NextState %>" data-role="updatestate" data-id="<%=ent.ID %>"><%=PassTxt[(int)ent.State] %></a>
            <a href="javascript:void(0)" class="btn" data-val="<%=PrevState %>" data-role="updatestate" data-id="<%=ent.ID %>"><%=FailTxt[(int)ent.State] %></a>
            <%} %>
        </div>
        <div class="enter_info">
            <ul>
                <li>
                    <span>企业名称</span>
                    <div><%=ent.CompanyName %></div>
                </li>
                <li>
                    <span>项目名称</span>
                    <div><%=ent.ProjectName %></div>
                </li>
                <li>
                    <span>成立时间</span>
                    <div><%=ent.CompanyRegTime %></div>
                </li>
                <li>
                    <span>法人代表</span>
                    <div><%=ent.LegalPerson %></div>
                </li>
                <li>
                    <span>注册地址</span>
                    <div><%=ent.RegisterAddr %></div>
                </li>
                <li>
                    <span>公司电话</span>
                    <div><%=ent.Tel %></div>
                </li>
                <li>
                    <span>注册资本</span>
                    <div><%=ent.Capital %>万</div>
                </li>
                <li>
                    <span>统一社会信用代码</span>
                    <div><%=ent.LicenseCode %></div>
                </li>
                <li>
                    <span>项目(商业)企划书</span>
                    <div>
                        <label><%=ent.ProjectPlan %></label>
                        <a href="<%=string.Format("{0}PlantFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.ProjectPlan.Substring(0,4),ent.ProjectPlan.Substring(4,2),ent.ProjectPlan.Substring(6,2),ent.ProjectPlan.Trim()) %>" class="download">下载</a>
                    </div>
                </li>
                <li>
                    <span>官网地址</span>
                    <div><%=ent.Url %></div>
                </li>
                <li>
                    <span>公司LOGO</span>
                    <a class="logo" title="查看" href="<%=!string.IsNullOrEmpty(ent.LogoPic)&&ent.LogoPic.Trim().Length>0?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LogoPic.Substring(0,4),ent.LogoPic.Substring(4,2),ent.LogoPic.Substring(6,2),ent.LogoPic):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png") %>" target="_blank">
                        <img src="<%=!string.IsNullOrEmpty(ent.LogoPic)&&ent.LogoPic.Trim().Length>0?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LogoPic.Substring(0,4),ent.LogoPic.Substring(4,2),ent.LogoPic.Substring(6,2),ent.LogoPic):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png") %>" /></a>
                </li>
                <li>
                    <span>营业执照</span>
                    <a class="logo" title="查看" href="<%=!string.IsNullOrEmpty(ent.LicensePic)&&ent.LicensePic.Trim().Length>0?string.Format("{0}LicesencePic/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LicensePic.Substring(0,4),ent.LicensePic.Substring(4,2),ent.LicensePic.Substring(6,2),ent.LicensePic):string.Format("{0}LicesencePic/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoPic.png") %>" target="_blank">
                        <img src="<%=!string.IsNullOrEmpty(ent.LicensePic)&&ent.LicensePic.Trim().Length>0?string.Format("{0}LicesencePic/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LicensePic.Substring(0,4),ent.LicensePic.Substring(4,2),ent.LicensePic.Substring(6,2),ent.LicensePic):string.Format("{0}LicesencePic/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoPic.png") %>" /></a>
                </li>
                <li class="last">
                    <span>公司介绍</span>
                    <div>
                        <%=ent.CompanyIntr %>
                    </div>
                </li>
                <li class="last">
                    <span>项目介绍</span>
                    <div>
                        <%=ent.ProjectIntr %>
                    </div>
                </li>
            </ul>
        </div>
    </div>
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
            $("[data-role='updatestate']").click(function () {
                var State = Number($(this).attr("data-val"));
                var ID = $(this).attr("data-id");
                if (State < 0) {
                    $(".reject_alert").show();
                    $("#Remark").val("");
                    switch (State)
                    {
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
            $(".close").click(function () {
                $(".alert").hide();
            });

        });
    </script>
</body>
</html>
