using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Finance_Info : System.Web.UI.Page
{
    protected Model.Financing fi = new Model.Financing();
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Financing f in BLL.BLL<Model.Financing>.Creator("select").Parameter("*", string.Format(" AND ID={0}", int.Parse(Request.QueryString["ID"]))))
            fi = f;
    }
}