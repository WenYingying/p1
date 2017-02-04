<%@ WebHandler Language="C#" Class="SendSmsHandler" %>

using System;
using System.Web;

public class SendSmsHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        if (string.IsNullOrEmpty(req.Form["MobilePhone"]) || !Common.GetInstance.IsMobilePhone(req.Form["MobilePhone"]))
        {
            Common.GetInstance.JsonErrorMessage("请提交合法的手机号码");
            return;
        }
        if (string.IsNullOrEmpty(req.Form["TemplateId"]))
        {
            Common.GetInstance.JsonErrorMessage("短信模板缺失");
            return;
        }
        int code = Common.GetInstance.GenerateCode();
        res.Write(string.Format("{{\"Result\":true,\"Message\":\"已发送\",\"Code\":\"{0}\",\"Debug\":\"{1}\"}}", EncryptUtil.DesEncode(string.Format("{0}|{1}|{2}", code, req.Form["MobilePhone"], DateTime.Now), System.Configuration.ConfigurationManager.AppSettings["PipeDesKey"]),code));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}