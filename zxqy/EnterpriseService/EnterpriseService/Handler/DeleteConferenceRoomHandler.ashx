<%@ WebHandler Language="C#" Class="DeleteConferenceRoomHandler" %>

using System;
using System.Web;

public class DeleteConferenceRoomHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
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
            Model.ConferenceRoom room = new Model.ConferenceRoom();
            room.ID = int.Parse(req.Form["ID"]);
            if (BLL.BLL<Model.ConferenceRoom>.Creator("delete").Parameter(room))
            {
                res.Write("{\"Result\":true,\"Message\":\"删除成功\"}");
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