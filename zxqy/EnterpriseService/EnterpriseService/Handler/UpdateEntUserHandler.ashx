<%@ WebHandler Language="C#" Class="UpdateEntUserHandler" %>

using System;
using System.Web;

public class UpdateEntUserHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["ID"]) || string.IsNullOrEmpty(req.Form["Mobile"]) || string.IsNullOrEmpty(req.Form["Password"]) || string.IsNullOrEmpty(req.Form["Permission"])|| string.IsNullOrEmpty(req.Form["Name"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }

            Model.EnterpriseUser usr = new Model.EnterpriseUser();
            usr.ID = Int64.Parse(req.Form["ID"]);
            usr.Mobile = req.Form["Mobile"].Trim();
            usr.Password = EncryptUtil.DesEncode(req.Form["Password"].Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]);
            usr.Name = server.UrlDecode(req.Form["Name"]).Trim();
            usr.Permission = server.UrlDecode(req.Form["Permission"]).Trim();
            usr.Post = server.UrlDecode(req.Form["Post"]).Trim();

            if (BLL.BLL<Model.EnterpriseUser>.Creator("update").Parameter(usr))
            {
                res.Write("{\"Result\":true,\"Message\":\"修改成功!\"}");
                return;
            }
            Common.GetInstance.JsonErrorMessage("未知错误");
        }
        catch (Exception ex)
        {
            Common.GetInstance.JsonErrorMessage(ex.Message);

        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}