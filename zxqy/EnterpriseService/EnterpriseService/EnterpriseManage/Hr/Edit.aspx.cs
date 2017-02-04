using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_Hr_Edit : System.Web.UI.Page
{
    protected Model.Hr hr = new Model.Hr();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Hr h in BLL.BLL<Model.Hr>.Creator("select").Parameter("ID,[PositionName],[Degree],[Trade] ,[Depart] ,[Salary] ,[Major] ,[Welfare] ,[Detail]", string.Format("AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
        {
            hr = h;
        }
    }
}