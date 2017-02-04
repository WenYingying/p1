<%@ WebHandler Language="C#" Class="UpdateEnterpriseInfoHandler" %>

using System;
using System.Web;

public class UpdateEnterpriseInfoHandler : IHttpHandler
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

            if (string.IsNullOrEmpty(req.Form["ID"]) || (string.IsNullOrEmpty(req.Form["CompanyName"]) && string.IsNullOrEmpty(req.Form["ProjectName"])))
            {
                Common.GetInstance.ErrorMessage("参数错误");
                return;
            }

            Model.Enterprise _obj = new Model.Enterprise();
            _obj.ID = Int64.Parse(req.Form["ID"]);
            _obj.CompanyName = server.UrlDecode(req.Form["CompanyName"]).Trim();
            _obj.CompanyIntr = server.UrlDecode(req.Form["CompanyIntr"]).Trim();
            _obj.LegalPerson = server.UrlDecode(req.Form["LegalPerson"]).Trim();
            _obj.RegisterAddr = server.UrlDecode(req.Form["RegisterAddr"]).Trim();
            _obj.LicenseCode = server.UrlDecode(req.Form["LicenseCode"]).Trim();
            _obj.ProjectName = server.UrlDecode(req.Form["ProjectName"]).Trim();
            _obj.ProjectIntr = server.UrlDecode(req.Form["ProjectIntr"]).Trim();
            _obj.ProjectPlan = server.UrlDecode(req.Form["ProjectPlan"]).Trim();
            _obj.Capital = req.Form["Capital"].Trim();
            _obj.LicensePic = req.Form["LicensePic"].Trim();
            _obj.CompanyRegTime = req.Form["CompanyRegTime"].Trim();
            _obj.LogoPic = req.Form["LogoPic"].Trim();
            _obj.Url = server.UrlDecode(req.Form["Url"].Trim());
            _obj.Tel = server.UrlDecode(req.Form["Tel"].Trim());

            if (BLL.BLL<Model.Enterprise>.Creator("update").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"修改成功\"}");
                return;
            }
            Common.GetInstance.ErrorMessage("未知错误");

        }
        catch (Exception ex)
        {
            Common.GetInstance.ErrorMessage(ex.Message);
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