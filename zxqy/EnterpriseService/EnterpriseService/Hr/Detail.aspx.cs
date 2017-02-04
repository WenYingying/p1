using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Detail : System.Web.UI.Page
{
    protected Model.Hr hr = new Model.Hr();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Hr h in BLL.BLL<Model.Hr>.Creator("select").Parameter("*", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
            hr = h;
        rpHrList.DataSource = BLL.BLL<Model.Hr>.Creator("select").Parameter("TOP 3 ID,PositionName,Salary,Depart", string.Format(" AND EnterpriseId={0} AND ID!={1} ORDER BY LastUpdateTime DESC", hr.EnterpriseId,hr.ID));
        rpHrList.DataBind();
    }
}