﻿<%@ WebHandler Language="C#" Class="UpdateFinancingStateHandler" %>

using System;
using System.Web;

public class UpdateFinancingStateHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
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
            Model.Financing _obj = new Model.Financing();
            _obj.ID = Int64.Parse(req.Form["ID"]);
            _obj.State = int.Parse(req.Form["State"]);
            if (BLL.BLL<Model.Financing>.Creator("update").Parameter(_obj))
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

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}