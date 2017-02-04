<%@ WebHandler Language="C#" Class="UpdateResumStateHandler" %>

using System;
using System.Web;

public class UpdateResumStateHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["ID"]) || string.IsNullOrEmpty(req.Form["State"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Resum _obj = new Model.Resum();
            _obj.ID = Int64.Parse(req.Form["ID"]);
            _obj.State = int.Parse(req.Form["State"]);
            if (BLL.BLL<Model.Resum>.Creator("update").Parameter(_obj))
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