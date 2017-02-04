<%@ WebHandler Language="C#" Class="DeleteFinancingHandler" %>

using System;
using System.Web;

public class DeleteFinancingHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if ( string.IsNullOrEmpty(req.Form["ID"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Financing _obj = new Model.Financing();
            _obj.ID = Int64.Parse(req.Form["ID"]);
            if (BLL.BLL<Model.Financing>.Creator("delete").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"删除成功!\"}");
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