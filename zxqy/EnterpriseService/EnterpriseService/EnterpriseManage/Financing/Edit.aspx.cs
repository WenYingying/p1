using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_Financing_Edit : System.Web.UI.Page
{
    protected Model.Financing info = new Model.Financing();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Financing i in BLL.BLL<Model.Financing>.Creator("select").Parameter("ID,Stage,Mobile,Money,Stock,Profit,Detail", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
        {
            info = i;
        }
    }
}