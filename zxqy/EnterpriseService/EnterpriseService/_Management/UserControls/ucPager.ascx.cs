using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ucPager : System.Web.UI.UserControl
{
    // Fields
    protected int endPageNo = 9;
    protected string filetype = string.Empty;
    protected int ipage = 1;
    protected int pagecnt = 1;
    protected int pageitemcnt = 10;
    protected string query = string.Empty;
    protected bool showBackSplit = false;
    protected bool showFrontSplit = false;
    protected int startPageNo = 2;
    protected string url = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        string[] strArray = base.Request.RawUrl.Split(new char[] { '?' });
        Regex regex = new Regex(@"\.\w+", RegexOptions.IgnoreCase);
        Regex regex2 = new Regex("-P[0-9]+|PageNo=[0-9]+", RegexOptions.IgnoreCase);
        Regex regex3 = new Regex("PageNo=[0-9]+(&)?", RegexOptions.IgnoreCase);
        this.url = strArray[0].Substring(strArray[0].LastIndexOf("/") + 1);
        this.filetype = regex.Match(this.url).ToString();
        if (url.LastIndexOf('.') > 0)
            this.url = this.url.Substring(0, this.url.LastIndexOf('.'));
        this.url = regex2.Replace(this.url, string.Empty);
        if (strArray.Length > 1)
        {
            this.query = "&" + regex3.Replace(strArray[1], string.Empty);
        }
        try
        {
            if (!object.Equals(null, base.Request.QueryString["PageNo"]))
            {
                this.ipage = int.Parse(base.Request.QueryString["PageNo"]);
            }
        }
        catch
        {
            this.ipage = 1;
        }
        if (this.pagecnt > 10)
        {
            this.showFrontSplit = this.ipage > 6;
            this.showBackSplit = this.ipage < (this.pagecnt - 6);
            this.startPageNo = ((this.ipage - 4) > 1) ? (this.ipage - 4) : 2;
            if (this.startPageNo == 2)
            {
                this.endPageNo = 10;
            }
            else
            {
                this.endPageNo = ((this.ipage + 5) >= this.pagecnt) ? (this.pagecnt - 1) : (this.ipage + 5);
            }
            if (this.endPageNo == (this.pagecnt - 1))
            {
                this.startPageNo = ((this.endPageNo - 10) > 1) ? (this.endPageNo - 10) : 2;
            }
        }
        else
        {
            this.startPageNo = (this.pagecnt > 1) ? 2 : 1;
            this.endPageNo = (this.pagecnt > 9) ? 9 : (this.pagecnt - 1);
        }
    }

    // Properties
    public int PageCount
    {
        set
        {
            this.pagecnt = value;
        }
    }

    public int PageItemCount
    {
        set
        {
            this.pageitemcnt = value;
        }
    }

}


