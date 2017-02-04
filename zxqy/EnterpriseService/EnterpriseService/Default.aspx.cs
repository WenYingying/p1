using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rpBannerList.DataSource = BLL.BLL<Model.Banner>.Creator("select").Parameter("*", " AND State>0 ORDER BY [Order] DESC,ID DESC");
        rpBannerList.DataBind();

        rpEntList.DataSource = BLL.BLL<Model.Enterprise>.Creator("select").Parameter("TOP 5 ID,CompanyName,LogoPic", " AND State>2 ORDER BY ID DESC");
        rpEntList.DataBind();

        rpFinanceList.DataSource= BLL.BLL<Model.Financing>.Creator("select").Parameter("TOP 4 ID,Money,Profit,PostTime,Detail,LogoPic,CompanyName", " AND State>0 ORDER BY State DESC, ID DESC");
        rpFinanceList.DataBind();

        rpHrList.DataSource = BLL.BLL<Model.Hr>.Creator("select").Parameter("TOP 4 ID,PositionName,Salary,PostTime,Degree,Major,Welfare,LastUpdateTime,LogoPic,CompanyName", " AND State>0 ORDER BY State DESC,ID DESC");
        rpHrList.ItemDataBound += RpHrList_ItemDataBound;
        rpHrList.DataBind();

        rpInfoList.DataSource= BLL.BLL<Model.Information>.Creator("select").Parameter("TOP 4 ID,Title,Type,PostTime,Content,CoverPic", " AND State>0 ORDER BY State DESC, ID DESC");
        rpInfoList.DataBind();
    }

    private void RpHrList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Literal li = (Literal)e.Item.FindControl("liWelFare");
        Model.Hr hr = (Model.Hr)e.Item.DataItem;
        foreach (string s in hr.Welfare.Split(','))
        {
            if (s.Length > 0)
                li.Text += string.Format("<span>{0}</span>", s);
        }
    }
}