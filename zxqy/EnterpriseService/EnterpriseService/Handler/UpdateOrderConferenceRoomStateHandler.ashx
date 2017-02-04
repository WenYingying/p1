<%@ WebHandler Language="C#" Class="UpdateOrderConferenceRoomStateHandler" %>

using System;
using System.Web;

public class UpdateOrderConferenceRoomStateHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
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
            Model.OrderConferenceRoom _obj = new Model.OrderConferenceRoom();
            _obj.ID = int.Parse(req.Form["ID"]);
            _obj.State = int.Parse(req.Form["State"]);
            if (!string.IsNullOrEmpty(req.Form["Reason"]))
                _obj.Reason = server.UrlDecode(req.Form["Reason"]).Trim();
            if (BLL.BLL<Model.OrderConferenceRoom>.Creator("update").Parameter(_obj))
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

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}