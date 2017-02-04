using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_SubMaster_SubEnterpriseManageMasterPage : System.Web.UI.MasterPage
{
    public Model.EnterpriseUser user = new Model.EnterpriseUser();
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["User"]))
        {
            Response.Redirect("../../Login.html", true);
        }
        user.ID = Int64.Parse(Request.Cookies["User"]["ID"]);
        user.EnterpriseId = Int64.Parse(Request.Cookies["User"]["EnterpriseID"]);
        user.Mobile = Server.UrlDecode(Request.Cookies["User"]["Mobile"]);
        user.Name = Server.UrlDecode(Request.Cookies["User"]["Name"]);
        user.Post = Server.UrlDecode(Request.Cookies["User"]["Post"]);
        user.Permission = Server.UrlDecode(Request.Cookies["User"]["Permission"]);
        user.LastLoginIp = Server.UrlDecode(Request.Cookies["User"]["LastLoginIp"]);
        user.LastLoginTime = Server.UrlDecode(Request.Cookies["User"]["LastLoginTime"]);
        user.CreateTime = Server.UrlDecode(Request.Cookies["User"]["CreateTime"]);
        user.CompanyName = Server.UrlDecode(Request.Cookies["User"]["CompanyName"]);
        user.EnterpriseState = int.Parse(Request.Cookies["User"]["EnterpriseState"]);
        HttpCookie cookie = Request.Cookies["User"];
        cookie.Expires = DateTime.Now.AddMinutes(3600);
        Response.Cookies.Add(cookie);
    }
}
