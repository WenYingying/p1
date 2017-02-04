<%@ WebHandler Language="C#" Class="DeleteHrHandler" %>

using System;
using System.Web;

public class DeleteHrHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["ID"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Hr _obj = new Model.Hr();
            _obj.ID = Int64.Parse(req.Form["ID"]);

            if (BLL.BLL<Model.Hr>.Creator("delete").Parameter(_obj))
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