<%@ WebHandler Language="C#" Class="PostAdminHandler" %>

using System;
using System.Web;

public class PostAdminHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["LoginName"]) || string.IsNullOrEmpty(req.Form["Password"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Admin _obj = new Model.Admin();
            _obj.LoginName = server.UrlDecode(req.Form["LoginName"]).Trim();
            _obj.Password = EncryptUtil.DesEncode(req.Form["Password"].Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]);
            _obj.Email = !string.IsNullOrEmpty(req.Form["Email"]) ? req.Form["Email"].Trim() : string.Empty;
            _obj.Name = !string.IsNullOrEmpty(req.Form["Name"]) ? server.UrlDecode(req.Form["Name"]).Trim() : string.Empty;
            _obj.Gender = !string.IsNullOrEmpty(req.Form["Gender"]) ? int.Parse(req.Form["Gender"]) : 1;
            _obj.Position = !string.IsNullOrEmpty(req.Form["Position"]) ? server.UrlDecode(req.Form["Position"]).Trim() : string.Empty;
            if (!string.IsNullOrEmpty(req.Form["Mobile"]))
                _obj.Mobile = req.Form["Mobile"].Trim();
            if (BLL.BLL<Model.Admin>.Creator("insert").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"添加成功!\"}");
                return;
            }
            Common.GetInstance.JsonErrorMessage("未知错误");
        }
        catch (Exception ex)
        {
            if (ex.Message.IndexOf("AK_KEY_2_ADMIN") > 0)
            {
                Common.GetInstance.JsonErrorMessage("该登录名已经被占用");
                return;
            }
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