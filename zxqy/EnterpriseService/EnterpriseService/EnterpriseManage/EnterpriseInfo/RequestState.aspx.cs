using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_EnterpriseInfo_RequestState : System.Web.UI.Page
{
    protected Model.Enterprise ent = new Model.Enterprise();
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] lineArr = {"active","" };
        foreach (Model.Enterprise c in BLL.BLL<Model.Enterprise>.Creator("select").Parameter("State,Remark,ID", string.Format(" AND ID={0}", int.Parse(Request.Cookies["User"]["EnterpriseID"]))))
        {
            ent = c;
        }
        ent.State = ent.State == null ? 0 : ent.State;
    }
}