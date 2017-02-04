using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_ConferenceRoom_RequestList : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    public enum StateTxt
    {
        预约失败=-1,
        待处理=0,
        预约成功=1
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string select_search = string.Format(" AND State=0");
        int pageno = 1;
        int pagecount = 0;
        int recordcount = 0;
        pageno = !string.IsNullOrEmpty(Request.QueryString["PageNo"]) ? int.Parse(Request.QueryString["PageNo"]) : pageno;
        if (!string.IsNullOrEmpty(Request.QueryString["State"]))
            select_search = string.Format(" AND State={0}", int.Parse(Request.QueryString["State"]));

        rpList.DataSource = BLL.BLL<Model.OrderConferenceRoom>.Creator("pager").Parameter("*", select_search, " ORDER BY ID DESC", pageno, 7, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
    }
}