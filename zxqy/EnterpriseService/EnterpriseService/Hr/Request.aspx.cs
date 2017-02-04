using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Request : System.Web.UI.Page
{
    protected Model.Hr hr = new Model.Hr();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Hr h in BLL.BLL<Model.Hr>.Creator("select").Parameter("*", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["HrID"]))))
            hr = h;

    }
}