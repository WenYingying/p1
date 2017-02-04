using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Enterprise_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordcount = 0;
        int pagecount = 0;
        int pageno = 1;
        string select_search = string.Empty;
        if (!string.IsNullOrEmpty(Request.QueryString["PageNo"]))
            pageno = int.Parse(Request.QueryString["PageNo"]);
        if (!string.IsNullOrEmpty(Request.QueryString["Keyword"]))
            select_search = string.Format(" AND CompanyName LIKE '%{0}%'", Server.UrlDecode(Request.QueryString["KeyWord"]).Trim());
        select_search = string.Format("{0}  AND State>2 ", select_search);

        rpList.DataSource = BLL.BLL<Model.Enterprise>.Creator("pager").Parameter("ID,CompanyName,LogoPic",select_search, " ORDER BY State DESC, ID DESC", pageno,15, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
    }
}