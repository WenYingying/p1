using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Information_Edit : System.Web.UI.Page
{
    protected Model.Information info = new Model.Information();
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Information i in BLL.BLL<Model.Information>.Creator("select").Parameter("ID,Title,Tags,CoverPic,Content,State,Type", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
        {
            info = i;
        }

    }
}