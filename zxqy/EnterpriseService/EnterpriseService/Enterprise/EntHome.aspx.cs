using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Enterprise_EntHome : System.Web.UI.Page
{
    protected Model.Enterprise ent = new Model.Enterprise();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Enterprise en in BLL.BLL<Model.Enterprise>.Creator("select").Parameter("*", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
            ent = en;

        rpInfoList.DataSource = BLL.BLL<Model.Information>.Creator("select").Parameter("TOP 3 ID,Title,Type,PostTime,Content,CoverPic", string.Format(" AND EnterpriseId={0} ORDER BY ID DESC",ent.ID));
        rpInfoList.DataBind();

        rpHrList.DataSource = BLL.BLL<Model.Hr>.Creator("select").Parameter("TOP 3 ID,PositionName,Salary,Depart", string.Format(" AND EnterpriseId={0} ORDER BY LastUpdateTime DESC", ent.ID));
        rpHrList.DataBind();


    }
}