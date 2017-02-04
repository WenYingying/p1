<%@ WebHandler Language="C#" Class="RequestHandler" %>

using System;
using System.Web;

public class RequestHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (
            #region 公共判断

                    string.IsNullOrEmpty(req.Form["RequestType"]) || string.IsNullOrEmpty(req.Form["Name"]) || string.IsNullOrEmpty(req.Form["Mobile"]) || string.IsNullOrEmpty(req.Form["Password"]) ||
            #endregion
            #region 企业判断

                    (req.Form["RequestType"].ToLower().Trim() == "enterprise" && (string.IsNullOrEmpty(req.Form["CompanyName"]) || string.IsNullOrEmpty(req.Form["LegalPerson"]) || string.IsNullOrEmpty(req.Form["LicenseCode"]) || string.IsNullOrEmpty(req.Form["RegisterAddr"])))
                ||
            #endregion
            #region 项目判断
                (req.Form["RequestType"].ToLower().Trim() == "project" && (string.IsNullOrEmpty(req.Form["ProjectName"]) || string.IsNullOrEmpty(req.Form["ProjectIntr"])))
            #endregion
                )
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Enterprise _obj = new Model.Enterprise();
            if (req.Form["RequestType"].ToLower().Trim() == "enterprise")
            {
                _obj.CompanyName = server.UrlDecode(req.Form["CompanyName"]).Trim();
                _obj.CompanyIntr = server.UrlDecode(req.Form["CompanyIntr"]).Trim();
                _obj.LegalPerson = server.UrlDecode(req.Form["LegalPerson"]).Trim();
                _obj.RegisterAddr = server.UrlDecode(req.Form["RegisterAddr"]).Trim();
                _obj.LicenseCode = server.UrlDecode(req.Form["LicenseCode"]).Trim();
            }
            _obj.ProjectName = server.UrlDecode(req.Form["ProjectName"]).Trim();
            _obj.ProjectIntr = server.UrlDecode(req.Form["ProjectIntr"]).Trim();
            _obj.ProjectPlan = server.UrlDecode(req.Form["ProjectPlan"]).Trim();

            if (BLL.BLL<Model.Enterprise>.Creator("insert").Parameter(_obj))
            {
                try
                {

                    Model.EnterpriseUser usr = new Model.EnterpriseUser();
                    usr.EnterpriseId = _obj.ID;
                    usr.Mobile = req.Form["Mobile"].Trim();
                    usr.Password = EncryptUtil.DesEncode(req.Form["Password"].Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]);
                    usr.Name = server.UrlDecode(req.Form["Name"]).Trim();
                    usr.Permission = "all";
                    usr.Post = "申请人";
                    if (BLL.BLL<Model.EnterpriseUser>.Creator("insert").Parameter(usr))
                    {
                        res.Write("{\"Result\":true,\"Message\":\"申请成功!\"}");
                        return;
                    }
                }
                catch (Exception ex)
                {
                    BLL.BLL<Model.Enterprise>.Creator("delete").Parameter(_obj);
                    throw new Exception(ex.Message);
                }
                Common.GetInstance.JsonErrorMessage("未知错误");
            }
        }
        catch (Exception ex)
        {
            if (ex.Message.IndexOf("Index_LicenseCode") > 0)
                Common.GetInstance.JsonErrorMessage("同一企业不能重复申请");
            else if (ex.Message.IndexOf("Index_Mobile") > 0)
                Common.GetInstance.JsonErrorMessage("已使用此手机号申请过入园");
            else
                Common.GetInstance.JsonErrorMessage(ex.Message);

        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}