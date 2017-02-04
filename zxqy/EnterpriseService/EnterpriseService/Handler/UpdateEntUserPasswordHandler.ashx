<%@ WebHandler Language="C#" Class="UpdateEntUserPasswordHandler" %>

using System;
using System.Web;

public class UpdateEntUserPasswordHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["ID"]) || string.IsNullOrEmpty(req.Form["OldPassword"]) || string.IsNullOrEmpty(req.Form["Password"]) )
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }

            if (BLL.BLL<Model.EnterpriseUser>.Creator("select").Parameter("1 AS ID ", string.Format(" AND ID={0} AND Password='{1}'", Int64.Parse(req.Form["ID"]), EncryptUtil.DesEncode(req.Form["OldPassword"].Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]))).Count == 0)
            {
                   Common.GetInstance.JsonErrorMessage("旧密码错误！");
                return;
         }

            Model.EnterpriseUser usr = new Model.EnterpriseUser();
            usr.ID = Int64.Parse(req.Form["ID"]);
            usr.Password = EncryptUtil.DesEncode(req.Form["Password"].Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]);

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