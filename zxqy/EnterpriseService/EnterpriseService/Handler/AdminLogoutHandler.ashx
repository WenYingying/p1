<%@ WebHandler Language="C#" Class="AdminLogoutHandler" %>

using System;
using System.Web;

public class AdminLogoutHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        if (!object.Equals(null, context.Request.Cookies["Admin"]))
        {
            HttpCookie cookie = context.Request.Cookies["Admin"];
            cookie.Expires = DateTime.Now.AddMinutes(-1);
            context.Response.Cookies.Add(cookie);
        }
        context.Response.Redirect("../_ManageMent/Login.aspx", true);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}