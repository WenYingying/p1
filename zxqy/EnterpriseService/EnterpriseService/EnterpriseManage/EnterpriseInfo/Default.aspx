<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="EnterpriseManage_EnterpriseInfo_Default" %>
<asp:Content ContentPlaceHolderID="phPageTitle" runat="server">企业信息</asp:Content>
<asp:Content ContentPlaceHolderID="phStyle" runat="server">
    <style type="text/css">
        .head .end {
            width: 1.5rem;
        }

        .right .bottom li > label > img, .right .bottom li > .upload_img > img {
            width: 0.6rem;
            height: 0.6rem;
            border: 1px solid #d4d4d4;
            vertical-align: middle;
        }

        .right .bottom .bottom_corporation, .right .bottom .bottom_product {
            width: 100%;
        }

            .right .bottom .bottom_corporation > span, .right .bottom .bottom_product > span {
                width: 15%;
                margin-right: 0.7%;
            }


        .right .bottom li > .btn > input {
            position: absolute;
            right: 0;
            top: 0;
            opacity: 0;
            width: 100%;
            height: 0.35rem;
            filter: alpha(opacity=0);
            cursor: pointer;
        }

        .btn {
            width: 1rem;
            height: 0.35rem;
            line-height: 0.35rem;
            border-radius: 0.02rem;
            display: none;
        }

        .bottom_top {
            vertical-align: top;
        }
    </style>

</asp:Content>
<asp:Content ContentPlaceHolderID="phContentTitle" runat="server">
    企业信息
</asp:Content>
<asp:Content ContentPlaceHolderID="phTools" runat="server">
    <a href="Edit.aspx">编辑</a>
</asp:Content>
<asp:Content ContentPlaceHolderID="phPageContent" runat="server">
    <div class="bottom">
        <ul>
            <li class="bottom_corporation">
                <span>企业名称</span>
                <label><%=Common.GetInstance.Trim(ent.CompanyName) %></label>
            </li>
            <li class="bottom_corporation">
                <span>项目名称</span>
                <label><%=Common.GetInstance.Trim(ent.ProjectName) %></label>
            </li>
            <li>
                <span>法人代表</span>
                <label><%=Common.GetInstance.Trim(ent.LegalPerson) %></label>
            </li>
            <li>
                <span>成立时间</span>
                <label><%=!string.IsNullOrEmpty(ent.CompanyRegTime)? Convert.ToDateTime(ent.CompanyRegTime).ToString("yyyy年MM月dd日"):"暂未提交" %></label>
            </li>
            <li>
                <span>公司注册地址</span>
                <label><%=Common.GetInstance.Trim(ent.RegisterAddr) %></label>
            </li>
            <li>
                <span>统一社会信用代码</span>
                <label><%=Common.GetInstance.Trim(ent.LicenseCode) %></label>
            </li>
            <li>
                <span>官网地址</span>
                <label><%=Common.GetInstance.Trim(ent.Url) %></label>
            </li>
            <li>
                <span>联系电话</span>
                <label><%=Common.GetInstance.Trim(ent.Tel) %></label>
            </li>
            <li>
                <span>注册资本</span>
                <label><%=Common.GetInstance.Trim(ent.Capital) %>万元</label>
            </li>
            <li style="position: relative;">
                <span>项目企划书</span>
                <label><a href="<%=string.Format("{0}PlantFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.ProjectPlan.Substring(0,4),ent.ProjectPlan.Substring(4,2),ent.ProjectPlan.Substring(6,2),ent.ProjectPlan.Trim()) %>">下载</a></label>
            </li>
            <li>
                <span>营业执照</span>
                <label>
                    <img src="<%=!string.IsNullOrEmpty(ent.LicensePic)&&ent.LicensePic.Trim().Length>0?string.Format("{0}LicesencePic/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LicensePic.Substring(0,4),ent.LicensePic.Substring(4,2),ent.LicensePic.Substring(6,2),ent.LicensePic):string.Format("{0}LicesencePic/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoPic.png") %>" /></label>
            </li>
            <li>
                <span>公司logo</span>
                <label>
                    <img src="<%=!string.IsNullOrEmpty(ent.LogoPic)&&ent.LogoPic.Trim().Length>0?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LogoPic.Substring(0,4),ent.LogoPic.Substring(4,2),ent.LogoPic.Substring(6,2),ent.LogoPic):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png") %>" /></label>
            </li>
            <li class="bottom_corporation">
                <span>公司介绍</span>
                <label class="bottom_top"><%=Common.GetInstance.Trim(ent.CompanyIntr) %></label>
            </li>
            <li class="bottom_product">
                <span>项目介绍</span>
                <label class="bottom_top"><%=Common.GetInstance.Trim(ent.ProjectIntr) %></label>
            </li>
        </ul>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="phScript" runat="server">
    <script type="text/javascript">
        $(function () {
            $("a[data-menu='Ent']").addClass("active");
        });
    </script>
</asp:Content>
