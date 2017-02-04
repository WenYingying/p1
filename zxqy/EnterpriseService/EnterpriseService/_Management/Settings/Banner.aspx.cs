using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Settings_Banner : System.Web.UI.Page
{
    public enum StateTxt
    {
        已停用=0,
        使用中=1
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        rpList.DataSource = BLL.BLL<Model.Banner>.Creator("select").Parameter("*", " ORDER BY [Order] DESC,ID DESC");
        rpList.DataBind();
    }
}