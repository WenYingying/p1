<%@ WebHandler Language="C#" Class="CheckSmsCodeHandler" %>

using System;
using System.Web;

public class CheckSmsCodeHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            res.Write("{\"Result\":true,\"Message\":\"验证正确\"}");
            return;
            if (string.IsNullOrEmpty(req.Form["Plaintext"]) || string.IsNullOrEmpty(req.Form["Ciphertext"]))
            {
                Common.GetInstance.JsonErrorMessage("信息缺失，无法验证");
                return;
            }
            string[] arrPlaintext = EncryptUtil.DesDecodeString(req.Form["Ciphertext"].Trim(), System.Configuration.ConfigurationManager.AppSettings["PipeDesKey"]).Split('|');
            string[] arrInputCode = req.Form["Plaintext"].Trim().Split('|');
            if (arrPlaintext.Length != 3 || arrInputCode.Length != 2)
            {
                res.Write("{\"Result\":false,\"Message\":\"不安全的验证码,请重新发送短信验证\"}");
                return;
            }
            if (arrInputCode[0] == arrPlaintext[0] && arrInputCode[1] == arrPlaintext[1] && DateTime.Now.Subtract(Convert.ToDateTime(arrPlaintext[2])).TotalMinutes < 30)
            {
                res.Write("{\"Result\":true,\"Message\":\"验证正确\"}");
                return;
            }
            res.Write("{\"Result\":false,\"Message\":\"验证码不正确或者验证码过期了\"}");
        }
        catch (Exception ex)
        {
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