using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Enterprise_EnterpriseInfo : System.Web.UI.Page
{
    protected Model.Enterprise ent = new Model.Enterprise();
    protected Model.EnterpriseUser user = new Model.EnterpriseUser();
    protected int NextState, PrevState;
    protected string[] PassTxt = { "评审通过，允许入住科技园","协议签订成功，进入工商手续办理", "营业执照审核通过,入驻科技园" };
    protected string[] FailTxt = { "评审失败，发回重新申请","协议签订失败", "营业执照审核失败，发回重新上传" };
    protected enum StateTxt
    {
        营业执照审核失败=-3,
        签订协议失败=-2,
        入园评审失败=-1,
        等待入园评审=0,
        等待签订入园协议=1,
        等待营业执照审核=2,
        入园成功=3,
        入园经营 = 4
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Enterprise en in BLL.BLL<Model.Enterprise>.Creator("select").Parameter("*", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
            ent = en;
        switch (ent.State)
        {
            case 0:
                NextState = 1;
                PrevState = -1;
                break;
            case 1:
                NextState = 2;
                PrevState = -2;
                break;
            case 2:
                NextState = 3;
                PrevState = -3;
                break;
            case 3:
                NextState = 4;
                PrevState = -3;
                break;
        }
        foreach (Model.EnterpriseUser u in BLL.BLL<Model.EnterpriseUser>.Creator("select").Parameter("TOP 1 Name,Mobile", string.Format(" AND EnterpriseId={0} AND Post='申请人' ORDER BY ID", ent.ID)))
        {
            user = u;
        }


    }
}