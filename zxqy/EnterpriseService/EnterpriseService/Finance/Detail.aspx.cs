using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_Detail : System.Web.UI.Page
{
    protected Model.Financing fi = new Model.Financing();
    protected Model.Enterprise ent = new Model.Enterprise();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Financing f in BLL.BLL<Model.Financing>.Creator("select").Parameter("*", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
            fi = f;
        foreach (Model.Enterprise en in BLL.BLL<Model.Enterprise>.Creator("select").Parameter("*", string.Format(" AND ID={0}", fi.EnterpriseId)))
            ent = en;
    }
}