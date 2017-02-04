<%@ WebHandler Language="C#" Class="UpdateEnterpriseStateHandler" %>

using System;
using System.Web;

public class UpdateEnterpriseStateHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["ID"]) || string.IsNullOrEmpty(req.Form["State"]) )
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Enterprise _obj = new Model.Enterprise();
            _obj.ID = Int64.Parse(req.Form["ID"]);
            _obj.State = int.Parse(req.Form["State"]);
            if (!string.IsNullOrEmpty(req.Form["Remark"]))
                _obj.Remark = server.UrlDecode(req.Form["Remark"]).Trim();

            if (BLL.BLL<Model.Enterprise>.Creator("updatestate").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"修改成功\"}");
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