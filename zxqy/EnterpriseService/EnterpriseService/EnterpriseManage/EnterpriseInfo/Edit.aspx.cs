using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_EnterpriseInfo_Edit : System.Web.UI.Page
{
    protected Model.Enterprise ent = new Model.Enterprise();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Enterprise c in BLL.BLL<Model.Enterprise>.Creator("select").Parameter("*", string.Format(" AND ID={0}", int.Parse(Request.Cookies["User"]["EnterpriseID"]))))
        {
            ent = c;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["State"]))
            ent.State = int.Parse(Request.QueryString["State"]);
    }
}