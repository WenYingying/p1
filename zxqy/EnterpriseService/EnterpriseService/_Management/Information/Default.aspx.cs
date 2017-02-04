using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Information_Default : System.Web.UI.Page
{
    protected enum StateTxt
    {
        审核未通过 = -1,
        待审核 = 0,
        发布中 = 1,
        企业推荐 = 2,
        推荐 = 3
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
        string select_search = string.Format(" AND Type='News'");
        int pageno = 1;
        int pagecount = 0;
        int recordcount = 0;
        pageno = !string.IsNullOrEmpty(Request.QueryString["PageNo"]) ? int.Parse(Request.QueryString["PageNo"]) : pageno;
        if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
            select_search = string.Format(" AND Type='{0}'", Request.QueryString["Type"].Trim());

        rpList.DataSource = BLL.BLL<Model.Information>.Creator("pager").Parameter("ID,Title,PostTime,State,Type", string.Format(" AND (EnterpriseId IS NULL OR LEN(EnterpriseId)=0 OR LEN(EnterpriseId) IS NULL) {0} ", select_search), " ORDER BY State DESC, ID DESC", pageno, 10, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
        pager.PageItemCount = 10;

    }
}