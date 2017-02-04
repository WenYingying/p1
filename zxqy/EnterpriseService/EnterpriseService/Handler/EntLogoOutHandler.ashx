<%@ WebHandler Language="C#" Class="EntLogoOutHandler" %>

using System;
using System.Web;

public class EntLogoOutHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        if (!object.Equals(null, context.Request.Cookies["User"]))
        {
            HttpCookie cookie = context.Request.Cookies["User"];
            cookie.Expires = DateTime.Now.AddDays(-1);
                context.Response.Cookies.Add(cookie);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}