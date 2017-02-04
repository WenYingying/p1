using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Hr_Resum : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int ipage = 1, pagecount = 0, recordcount = 0;
        if (!string.IsNullOrEmpty(Request.QueryString["PageNo"]))
            ipage = int.Parse(Request.QueryString["PageNo"]);
        rpList.DataSource = BLL.BLL<Model.Resum>.Creator("pager").Parameter("*", string.Empty, " ORDER BY ID DESC,State DESC", ipage, 10, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
        pager.PageItemCount = 10;

    }
}